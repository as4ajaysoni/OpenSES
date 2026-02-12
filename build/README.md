# OpenSES Executables

This directory contains different versions of the OpenSES executable:

## Available Versions

- **OpenSES** - Original version with standard parameter limits
  - Compiled for Linux x86-64 systems
  - Standard capacity limits as defined in the original code

- **OpenSES_v4.2_linux** - Linux version with increased parameter limits
  - Compiled for Linux x86-64 systems  
  - Enhanced capacity with increased limits for larger models
  - Supports larger subway system simulations than the original

- **OpenSES_v4.2.exe** - Windows version with increased parameter limits
  - Compiled for Windows x86-64 systems
  - Enhanced capacity with increased limits for larger models
  - Supports larger subway system simulations than the original

- **OpenSES.exe** - Legacy Windows executable from original repository

## Platform Compatibility

The executables are compiled for their respective platforms:
- Linux executables: Linux x86-64 systems
- Windows executables: Windows x86-64 systems

For other platforms (macOS), you will need to build from source using the appropriate Fortran compiler for your platform.

## Building for Windows

To build Windows executables from Linux, you can use cross-compilation with MinGW-w64:

1. Install MinGW-w64 gfortran:
   ```bash
   sudo apt-get install gfortran-mingw-w64-x86-64
   ```

2. Navigate to the source directory and build:
   ```bash
   cd source
   make win-release
   ```

This will create a Windows executable in the `source/win64/` directory.

### Building Enhanced Version for Windows

To build the enhanced version with increased parameter limits for Windows:

```bash
cd source
make win-enhanced
```

This will create an enhanced Windows executable in the `source/win64_enhanced/` directory.

## Parameter Limits

The increased limits version supports:
- Up to 3600 sections (vs 900 in original)
- Up to 2400 nodes of each type (vs 600 in original)
- Up to 2480 line segments (vs 620 in original)
- Up to 1624 ventilation shafts (vs 406 in original)
- And other increased limits as detailed in the main documentation