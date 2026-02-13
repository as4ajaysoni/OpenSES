#!/bin/bash

# OpenSES Performance Benchmark Script

echo "OpenSES Performance Benchmark"
echo "============================="

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

echo ""
echo "Running benchmarks with inferno.inp input file..."
echo ""

# Function to run a single benchmark
run_benchmark() {
    local exe="$1"
    local name="$2"
    
    if [ ! -f "$exe" ]; then
        echo "Warning: $exe not found, skipping $name test"
        return
    fi
    
    echo "Testing $name version..."
    local start_time=$(date +%s.%N)
    timeout 30s ./$exe inferno.inp > "${name}_output.log" 2>&1
    local end_time=$(date +%s.%N)
    local duration=$(echo "$end_time - $start_time" | bc -l)
    
    if [ $? -eq 124 ]; then
        echo "$name: Timed out after 30 seconds"
    else
        echo "$name: ${duration}s"
    fi
    echo ""
}

# Run benchmarks
run_benchmark "./release/OpenSES" "Regular Release"
run_benchmark "./optimized/OpenSES" "Optimized Release" 
run_benchmark "./high-perf/OpenSES" "High-Performance"

echo "Benchmark complete. Output logs saved as *_output.log"
echo "Note: Times are approximate and can vary based on system load."