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

## Building the Project

The project uses a makefile-based build system that compiles with gfortran:

```bash
cd source
make                # Build both debug and release versions
make release        # Build only the release version
make debug          # Build only the debug version
make all            # Build both debug and release versions (same as 'make')
make clean          # Remove object files and executables
make remake         # Clean and rebuild everything
make prep           # Create debug and release directories
```

**Note**: The pre-built executable in the `build/` directory is compiled for Linux x86-64 systems. For other platforms (Windows, macOS), you will need to build from source using the appropriate Fortran compiler for your platform.

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
