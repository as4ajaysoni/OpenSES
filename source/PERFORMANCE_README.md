# OpenSES Performance Optimization Guide

This document describes the performance optimization options available for OpenSES.

## Build Targets

The OpenSES makefile now includes multiple build targets optimized for different performance needs:

### 1. Regular Release (`make release`)
- Default optimization level
- Flags: `-falign-commons -Wno-align-commons -std=legacy`
- Best for compatibility and debugging

### 2. High-Performance Release (`make high-perf`)
- Aggressive performance optimizations
- Flags: `-falign-commons -Wno-align-commons -std=legacy -O3 -Ofast -march=native -mtune=native -ffast-math -funroll-loops -ftree-vectorize -floop-optimize`
- Maximum performance, may sacrifice some numerical precision for speed

## Performance Comparison

Based on testing with the `inferno.inp` sample file on a typical system:

- **Regular Release**: Baseline performance (~0.019s for initial test)
- **High-Performance**: ~48% performance improvement (~0.010s for initial test)

Actual performance gains will vary depending on:
- Input file complexity
- Hardware specifications
- System load

The benchmark script (`benchmark.sh`) can be used to measure performance on your specific system and input files.

## Compiler Flags Explained

- `-O3`: Enables all optimization techniques that do not involve a space-speed tradeoff
- `-Ofast`: Enables all optimizations, including those that may violate strict standards compliance
- `-march=native`: Generate instructions for the CPU running the compilation
- `-mtune=native`: Optimize for the specific CPU running the compilation
- `-ffast-math`: Sets -fno-math-errno, -funsafe-math-optimizations, -ffinite-math-only, and -fcx-limited-range
- `-funroll-loops`: Unroll loops for better performance
- `-ftree-vectorize`: Enable tree-based loop vectorization
- `-floop-optimize`: Additional loop optimizations

## High-Performance Build Summary

The high-performance build achieves up to 48% better performance through:

1. **Aggressive Math Optimizations**: Using `-Ofast` and `-ffast-math` to accelerate mathematical computations
2. **Architecture-Specific Tuning**: Using `-march=native` and `-mtune=native` for CPU-optimized instructions
3. **Loop Optimizations**: Unrolling and vectorizing loops for SIMD processing
4. **Memory Access Optimization**: Improved cache efficiency through vectorization

These optimizations particularly benefit the computational kernels in air flow calculations, thermal dynamics, and train simulation components of OpenSES.

## Usage Recommendations

1. **Development/Debugging**: Use `make release` for better debugging support
2. **Production Runs**: Use `make high-perf` when maximum performance is critical

## Notes

- The high-performance build may produce slightly different numerical results due to floating-point optimizations
- Always validate results when switching between build types
- Performance gains will be most noticeable on computationally intensive simulations