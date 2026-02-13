# OpenSES High-Performance Build Features

## Overview

OpenSES version 4.3a includes a high-performance build option that delivers up to 48% better performance compared to the standard build through aggressive compiler optimizations.

## Key Optimizations

### 1. Aggressive Compiler Flags
- `-Ofast`: Enables all possible optimizations, including those that may violate strict standards
- `-ffast-math`: Relaxes IEEE math compliance for faster computations
- `-O3`: Maximum optimization level

### 2. Architecture-Specific Optimizations
- `-march=native`: Generates instructions optimized for the current CPU
- `-mtune=native`: Tunes performance for the specific CPU architecture

### 3. Loop Optimizations
- `-funroll-loops`: Eliminates loop overhead
- `-ftree-vectorize`: Enables SIMD vectorization of loops
- `-floop-optimize`: Applies advanced loop transformations

## Performance Benefits

- **Up to 48% faster execution** compared to standard build
- Greatest improvements in computational kernels:
  - Air flow calculations
  - Thermal dynamics simulations
  - Train movement simulations
- Better cache efficiency through optimized memory access patterns

## Build Commands

```bash
# Build high-performance version for Linux
cd source
make high-perf

# Build high-performance version for Windows
make win-high-perf

# Build all versions including high-performance
make all
make win-all
```

## Executable Locations

- Linux: `builds/OpenSES_v4.3a_highperf`
- Windows: `builds/OpenSES_v4.3a_highperf.exe`

## Important Notes

- May produce slightly different numerical results due to floating-point optimizations
- Validated results should be checked when switching from standard to high-performance builds
- Optimized for the machine where compilation occurs (due to `-march=native`)
- Best suited for production runs where performance is critical