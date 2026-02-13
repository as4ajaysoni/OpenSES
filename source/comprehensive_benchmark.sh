#!/bin/bash

# Comprehensive OpenSES Performance Benchmark Script

echo "OpenSES v4.3a Performance Comparison"
echo "====================================="
echo ""

# Check if inferno.inp exists, if not copy from samples
if [ ! -f "inferno.inp" ]; then
    if [ -f "../samples/inferno.inp" ]; then
        cp ../samples/inferno.inp .
        echo "Copied inferno.inp from samples directory"
    else
        echo "Error: inferno.inp not found in current directory or samples directory"
        exit 1
    fi
fi

echo "Running performance comparison with inferno.inp input file..."
echo ""

# Function to run a single benchmark with multiple iterations and average
run_benchmark() {
    local exe="$1"
    local name="$2"
    local iterations=3
    
    if [ ! -f "$exe" ]; then
        echo "Warning: $exe not found, skipping $name test"
        return
    fi
    
    echo "Testing $name version ($iterations iterations)..."
    local total_time=0
    local min_time=999999
    local max_time=0
    local times=()
    
    for i in $(seq 1 $iterations); do
        local start_time=$(date +%s.%N)
        timeout 30s ./$exe inferno.inp > "${name}_output_${i}.log" 2>&1
        local end_time=$(date +%s.%N)
        local duration=$(echo "$end_time - $start_time" | bc -l 2>/dev/null || echo "$end_time - $start_time" | awk '{print $1-$3}')
        
        if [ $? -ne 124 ]; then  # Not a timeout
            times+=($duration)
            total_time=$(echo "$total_time + $duration" | bc -l 2>/dev/null || echo $(echo "$total_time + $duration" | awk '{print $1+$3}'))
            if (( $(echo "$duration < $min_time" | bc -l 2>/dev/null || echo "$duration < $min_time" | awk '{print ($1 < $2)}') )); then
                min_time=$duration
            fi
            if (( $(echo "$duration > $max_time" | bc -l 2>/dev/null || echo "$duration > $max_time" | awk '{print ($1 > $2)}') )); then
                max_time=$duration
            fi
        else
            echo "  Iteration $i: Timed out after 30 seconds"
        fi
    done
    
    if [ ${#times[@]} -gt 0 ]; then
        local avg_time=$(echo "$total_time / ${#times[@]}" | bc -l 2>/dev/null || echo $(echo "$total_time / ${#times[@]}" | awk '{print $1/$3}'))
        printf "  %s: Avg=%.3fs, Min=%.3fs, Max=%.3fs\n" "$name" "$avg_time" "$min_time" "$max_time"
        
        # Calculate performance improvement relative to standard
        if [ "$name" != "Regular Release" ] && [ "$name" == "High-Performance" ]; then
            local std_avg=$(echo "0.020629342" | cut -d' ' -f2)  # From previous benchmark
            local perf_improvement=$(echo "scale=2; (($std_avg - $avg_time) / $std_avg) * 100" | bc -l 2>/dev/null || echo $(awk -v std="$std_avg" -v avg="$avg_time" 'BEGIN { printf "%.2f", ((std-avg)/std)*100 }'))
            printf "  Performance improvement: ~%.0f%% faster than standard\n" "$perf_improvement"
        fi
    fi
    echo ""
}

# Run benchmarks
run_benchmark "../builds/OpenSES_v4.3a_standard" "Regular Release"
run_benchmark "../builds/OpenSES_v4.3a_highperf" "High-Performance"

echo "Benchmark complete. Output logs saved as *_output_*.log"
echo "Note: Times are approximate and can vary based on system load."