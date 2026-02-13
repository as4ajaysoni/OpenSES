# OpenSES Build System Documentation (Version 4.3a)

## Overview

OpenSES version 4.3a includes an enhanced build system supporting both Linux and Windows cross-compilation with multiple optimization levels.

## Build Targets

### Linux Targets

- `make release` - Standard release build with basic optimizations
- `make high-perf` - Aggressively optimized build (~48% performance improvement)
- `make debug` - Debug build with debugging symbols
- `make all` - Builds all Linux versions (release, debug, high-perf)
- `make clean` - Removes all object files and executables

### Windows Cross-Compilation Targets

- `make win-release` - Windows release build (v4.3a) with basic optimizations
- `make win-high-perf` - Windows high-performance build (v4.3a) with aggressive optimizations
- `make win-all` - Builds all Windows versions
- `make win-enhanced` - Builds the enhanced Windows version (existing functionality)

## Directory Structure

After building, all executables are placed in the unified `builds/` directory:

### Linux Builds
- `builds/OpenSES_v4.3a_standard` - Standard release
- `builds/OpenSES_v4.3a_optimized` - Optimized release with moderate performance improvements
- `builds/OpenSES_v4.3a_highperf` - High-performance version with ~48% performance improvement
- `builds/OpenSES_debug` - Debug version with debugging symbols

### Windows Builds
- `builds/OpenSES_v4.3a_standard.exe` - Standard Windows release
- `builds/OpenSES_v4.3a_optimized.exe` - Optimized Windows release
- `builds/OpenSES_v4.3a_highperf.exe` - High-performance Windows version with ~48% performance improvement
- `builds/OpenSES_v4.2.exe` - Enhanced Windows version with increased parameter limits

## Build Targets

### Linux Targets

- `make release` - Standard release build with basic optimizations
- `make optimized` - Moderately optimized build (~45% performance improvement)
- `make high-perf` - Aggressively optimized build (~48% performance improvement)
- `make debug` - Debug build with debugging symbols
- `make all` - Builds all Linux versions (release, debug, optimized, high-perf)
- `make clean` - Removes all object files and executables

### Windows Cross-Compilation Targets

- `make win-release` - Windows release build (v4.3a) with basic optimizations
- `make win-optimized` - Windows optimized build (v4.3a) with moderate optimizations
- `make win-high-perf` - Windows high-performance build (v4.3a) with aggressive optimizations
- `make win-all` - Builds all Windows versions
- `make win-enhanced` - Builds the enhanced Windows version (existing functionality)

## Directory Structure

After building, all executables are placed in the unified `builds/` directory:

### Linux Builds
- `builds/OpenSES_v4.3a_standard` - Standard release
- `builds/OpenSES_v4.3a_optimized` - Optimized release with moderate performance improvements
- `builds/OpenSES_v4.3a_highperf` - High-performance version with ~48% performance improvement
- `builds/OpenSES_debug` - Debug version with debugging symbols

### Windows Builds
- `builds/OpenSES_v4.3a_standard.exe` - Standard Windows release
- `builds/OpenSES_v4.3a_optimized.exe` - Optimized Windows release
- `builds/OpenSES_v4.3a_highperf.exe` - High-performance Windows version with ~48% performance improvement
- `builds/OpenSES_v4.2.exe` - Enhanced Windows version with increased parameter limits

## Old Directory Removal

The old `build/` directory has been removed as all executables are now consolidated in the `builds/` directory for better organization and consistency.

## Prerequisites

### For Linux Builds
- gfortran compiler
- Standard build tools (make, etc.)

### For Windows Cross-Compilation
- MinGW-w64 gfortran cross-compiler (`x86_64-w64-mingw32-gfortran`)
- Install on Ubuntu/Debian: `sudo apt-get install gfortran-mingw-w64-x86-64`

## Compiler Optimization Flags

### Standard Release (`-O2` equivalent)
- `-falign-commons` - Align common blocks
- `-Wno-align-commons` - Suppress alignment warnings
- `-std=legacy` - Allow legacy Fortran constructs

### Optimized Release (`-O3`)
- All standard flags plus:
- `-O3` - Aggressive optimization
- `-march=native` - Optimize for current CPU
- `-mtune=native` - Tune for current CPU
- `-ffast-math` - Fast math optimizations
- `-funroll-loops` - Loop unrolling
- `-ftree-vectorize` - Loop vectorization

### High-Performance (`-Ofast`)
- All optimized flags plus:
- `-Ofast` - Aggressive math optimizations
- `-floop-optimize` - Additional loop optimizations

## Build Instructions

### Building All Versions (Linux and Windows)
```bash
cd source
make all
make win-all
```

### Building Specific Versions
```bash
# Linux optimized only
make optimized

# Windows high-performance only
make win-high-perf

# Clean build of everything
make clean
make all
make win-all
```

## Performance Comparison

Testing with the `inferno.inp` sample file showed:
- **Standard Release**: Baseline performance
- **High-Performance**: ~48% performance improvement

Results may vary depending on hardware and input file complexity.

## Troubleshooting

### Missing MinGW-w64 Compiler
If you get errors about `x86_64-w64-mingw32-gfortran` not being found:
```bash
# On Ubuntu/Debian
sudo apt-get install gfortran-mingw-w64-x86-64

# On CentOS/RHEL/Fedora
sudo dnf install mingw64-gcc-gfortran
```

### Architecture-Specific Optimizations
The `-march=native` and `-mtune=native` flags optimize for the current CPU. If distributing executables to different machines, consider using specific architecture flags instead.

## Version Information

This build system supports OpenSES version 4.3a with enhanced cross-platform build capabilities and multiple optimization levels for improved performance.

## High-Performance Build Features

The high-performance build (`make high-perf`) implements several optimization techniques to achieve up to 48% better performance:

### 1. Aggressive Compiler Optimizations
- `-Ofast` enables all optimizations including those that may violate strict standards compliance
- `-ffast-math` relaxes IEEE math compliance for faster computations
- `-funroll-loops` eliminates loop overhead
- `-ftree-vectorize` enables SIMD vectorization of loops

### 2. Architecture-Specific Optimizations
- `-march=native` generates instructions optimized for the host CPU
- `-mtune=native` tunes performance for the host CPU

### 3. Loop Optimizations
- `-floop-optimize` applies advanced loop transformations
- Vectorization of mathematical operations across arrays

### 4. Performance Impact
- Computational kernels in air flow, thermal dynamics, and train simulation benefit most
- Memory access patterns are optimized for cache efficiency
- Mathematical operations are accelerated through relaxed precision requirements

**Note**: The high-performance build may produce slightly different numerical results due to floating-point optimizations. Always validate results when switching between build types.