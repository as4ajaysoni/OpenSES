# OpenSES Version 4.3a Release Notes

## Release Overview

OpenSES version 4.3a introduces enhanced build system capabilities with cross-platform support for both Linux and Windows, along with multiple optimization levels for improved performance.

## New Features

### Enhanced Build System
- Added support for two optimization levels (regular and high-performance)
- Cross-compilation support for Windows from Linux environment
- Automated build script for simultaneous Linux and Windows builds
- Comprehensive documentation for build processes

### Performance Optimizations
- **High-Performance Build**: ~48% performance improvement using `-Ofast` and additional loop optimizations
- Architecture-specific optimizations for better CPU utilization

### Cross-Platform Support
- Single build system supporting both Linux and Windows
- Consistent versioning across platforms (v4.3a)
- Separate executables for different optimization levels

## Build Targets

### Linux Builds
- `make release` - Standard release build
- `make high-perf` - High-performance build with aggressive optimizations
- `make debug` - Debug build with symbols
- `make all` - All Linux versions

### Windows Builds
- `make win-release` - Windows standard release (v4.3a)
- `make win-high-perf` - Windows high-performance version (v4.3a)
- `make win-all` - All Windows versions
- `make win-enhanced` - Enhanced Windows version with increased limits

## Performance Improvements

Compared to the previous version, the high-performance build shows:
- High-Performance: ~48% reduction in execution time
- Tested with standard `inferno.inp` sample file

## Files Included

- `BUILD_SYSTEM.md` - Comprehensive build documentation
- `build_all.sh` - Automated build script for Linux and Windows
- Updated makefile with new build targets
- `PERFORMANCE_README.md` - Performance optimization guide
- `benchmark.sh` - Performance comparison script

## Prerequisites

### For Linux Builds
- gfortran compiler
- Standard build tools (make, etc.)

### For Windows Cross-Compilation
- MinGW-w64 gfortran cross-compiler (`x86_64-w64-mingw32-gfortran`)

## Upgrade Notes

Existing build processes remain compatible. The new build system extends functionality without breaking existing workflows.

## Known Issues

- Windows builds require MinGW-w64 toolchain installation
- Architecture-specific optimizations may not be optimal when running on different CPU architectures

## Support

For support, refer to the updated documentation in `BUILD_SYSTEM.md` and `README.md`.