# OpenSES

OpenSES is an open-source fork of version 4.1 of the Subway Environment Simulation (SES) one-dimensional tunnel model. It is designed to simulate subway environments, focusing on air flow, temperature, humidity, and train operations in tunnel systems.

## Overview

The Subway Environment Simulation (SES) is a computational tool used to model the environmental conditions within subway systems. It simulates air movement, heat transfer, and other environmental factors in tunnel networks, which is crucial for ventilation design, emergency scenario planning (such as fire simulations), and climate control in subway systems.

## Features

- **Air Flow Simulation**: Models air movement through tunnel networks, including the effects of train movement and ventilation systems
- **Thermal Analysis**: Simulates temperature distributions and heat transfer throughout the subway system
- **Humidity Modeling**: Tracks moisture content and humidity levels in the environment
- **Train Operations**: Models train movement, acceleration, deceleration, and associated environmental impacts
- **Emergency Scenarios**: Capabilities to simulate fire events and other emergency conditions
- **Environmental Controls**: Modeling of heating, cooling, and ventilation systems
- **Ventilation Shafts**: Detailed modeling of ventilation infrastructure

## Architecture

The codebase is written in Fortran and follows a modular structure:

- **Main Program**: `DSES.FOR` serves as the main entry point
- **Shared Variables**: `DSHARE` contains global parameters and common blocks
- **Specialized Modules**: Multiple Fortran files handle specific aspects:
  - Input processing (`INPUT.FOR`)
  - Train simulation (`TRAIN.FOR`)
  - Heat transfer (`HEAT.FOR`, `HEATUP.FOR`)
  - Air flow calculations (`AIR.FOR`)
  - Output routines (`PRINT.FOR`)
  - And many others

### Parameter Limits

The maximum values for various parameters are defined in the `DSHARE` file:

- **Sections**: Up to 3600 sections (`LMSECT = 3600`) - increased from original
- **Nodes**: Up to 2400 aerodynamic nodes (`LMNODE = 2400`) and 2400 thermodynamic nodes (`LMTHND = 2400`) - increased from original
- **Line Segments**: Up to 2480 line segments (`LMLSEG = 2480`) - increased from original
- **Ventilation Shafts**: Up to 1624 ventilation shafts (`LMVSEG = 1624`) - increased from original
- **Environmental Control Zones**: Up to 300 zones (`LMCLST = 300`) - increased from original
- **Trains**: Up to 300 operational trains (`LMTRAN = 300`) of 64 different types (`LMTRTP = 64`) - increased from original
- **Train Routes**: Up to 80 train routes (`LMTRRT = 80`) - increased from original
- **Fan Types**: Up to 300 fan types (`LMFNTP = 300`) - increased from original
- **Unsteady Heat Sources**: Up to 200 sources (`LMUL = 200`) - increased from original
- **Print Groups**: Up to 100 print groups (`LMPRGP = 100`) - increased from original
- **Flow Loops**: Up to 2000 flow loops (`LMNLOP = 2000`) - increased from original

These limits define the maximum capacity of the simulation model. Note that some parameters may have interdependencies that need to be considered when increasing limits (e.g., `LMBLP` which is approximately 0.05*LMSECT²).

Modern systems have sufficient RAM to handle these increased limits, allowing for much more complex subway system simulations than originally possible.

## Building the Project

The project uses an enhanced makefile-based build system that compiles with gfortran and supports multiple optimization levels:

### Linux Builds
```bash
cd source
make                # Build debug, release, and high-perf versions
make release        # Build only the standard release version
make high-perf      # Build the high-performance version (~48% performance improvement)
make debug          # Build only the debug version
make all            # Build all Linux versions (same as 'make')
make clean          # Remove all object files and executables
make remake         # Clean and rebuild everything
make prep           # Create all necessary directories
```

### Windows Cross-Compilation
To build Windows executables on Linux, you need MinGW-w64:
```bash
# Install MinGW-w64 gfortran (Ubuntu/Debian):
sudo apt-get install gfortran-mingw-w64-x86-64

# Then build Windows versions:
make win-release        # Build Windows standard release
make win-high-perf      # Build Windows high-performance version
make win-all            # Build all Windows versions
```

### Complete Build (Linux and Windows)
```bash
# Using the build script:
cd ..
./build_all.sh

# Or manually:
cd source
make all        # Linux builds
make win-all    # Windows builds (requires mingw)
```

The build system creates executables for OpenSES version 4.3a with enhanced performance capabilities.

## High-Performance Build Options

OpenSES 4.3a includes multiple optimization levels:

- **Standard Release**: Baseline performance with standard optimizations
- **Optimized Build**: ~45% performance improvement using moderate optimizations
- **High-Performance Build**: ~48% performance improvement using aggressive optimizations

For more details on the high-performance features, see [HIGH_PERFORMANCE_FEATURES.md](HIGH_PERFORMANCE_FEATURES.md).

### Building Enhanced Version for Windows

To build the enhanced version with increased parameter limits for Windows:

```bash
cd source
make win-enhanced
```

This will create an enhanced Windows executable in the `source/win64_enhanced/` directory.

**Note**: For information about the pre-built executables in the `build/` directory, see the `build/README.md` file.

The build directory includes executables for both Linux and Windows platforms:
- Linux executables: Native Linux versions for x86-64 systems
- Windows executables: Cross-compiled versions for Windows x86-64 systems

For other platforms (macOS), you will need to build from source using the appropriate Fortran compiler for your platform.

### Build Process Details

The build process involves several steps:

1. **Prerequisites**: Ensure that gfortran compiler is installed on your system
2. **Directory Setup**: The build creates `debug/` and `release/` subdirectories
3. **Compilation**: Each `.FOR` source file is compiled to an object file (`.o`)
4. **Linking**: Object files are linked to create the final executable

### Compiler Flags

- **Release version**: Uses `-falign-commons -Wno-align-commons -std=legacy`
- **Debug version**: Uses `-falign-commons -Wno-align-commons -std=legacy -ggdb` (includes debugging symbols)

### Executable Locations

After building, executables are located at:
- **Release version**: `source/release/OpenSES`
- **Debug version**: `source/debug/OpenSES`

The build system creates static executables using the `-static` linker flag, which embeds all necessary libraries into the executable for better portability.

### Source Files

The build process compiles 67 Fortran source files, including:
- Main program: `DSES.FOR`
- Core modules: `INPUT.FOR`, `TRAIN.FOR`, `AIR.FOR`, `HEAT.FOR`, etc.
- Utility modules: `PRINT.FOR`, `SIMLAT.FOR`, `RSTREAD.FOR`, etc.
```

## Usage

The simulation is controlled through input files that define the subway network geometry, train schedules, environmental conditions, and other parameters. Sample input files are provided in the `samples/` directory.

To run a simulation:
```bash
cd source
make release
./release/OpenSES input_file.inp
```

The executable will generate output files with extensions like `.OUT` and `.RST` containing the simulation results.

Example of running with a sample file:
```bash
cp samples/inferno.inp source/
cd source
make release
./release/OpenSES inferno.inp
```

This will create output files such as `inferno.OUT` with the simulation results.

**Platform Compatibility**: The executable in the `build/` directory is compiled for Linux x86-64 systems. For other platforms (Windows, macOS), you will need to build from source using the appropriate Fortran compiler for your platform.

## Input File Format

Input files define the subway system characteristics including:
- Network geometry (sections, nodes, segments)
- Train routes and types
- Environmental conditions
- Ventilation systems
- Emergency scenarios (fires, etc.)

See the sample files in the `samples/` directory for examples of the input format.

## Applications

- Ventilation system design for subway networks
- Emergency scenario planning and evacuation procedures
- Climate control system optimization
- Air quality assessment in subway environments
- Fire safety analysis in tunnel systems

## License

OpenSES is released under the BSD 3-Clause License. See the source code files for detailed license information.
