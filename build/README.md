# OpenSES Executables

This directory contains different versions of the OpenSES executable:

## Available Versions

- **OpenSES** - Original version with standard parameter limits
  - Compiled for Linux x86-64 systems
  - Standard capacity limits as defined in the original code

- **OpenSES_v4.2** - Version with increased parameter limits
  - Compiled for Linux x86-64 systems  
  - Enhanced capacity with increased limits for larger models
  - Supports larger subway system simulations than the original

## Platform Compatibility

Both executables are compiled for Linux x86-64 systems. For other platforms (Windows, macOS), you will need to build from source using the appropriate Fortran compiler for your platform.

## Parameter Limits

The increased limits version supports:
- Up to 3600 sections (vs 900 in original)
- Up to 2400 nodes of each type (vs 600 in original)
- Up to 2480 line segments (vs 620 in original)
- Up to 1624 ventilation shafts (vs 406 in original)
- And other increased limits as detailed in the main documentation