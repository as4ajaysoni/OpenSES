# OpenSES v4.2 Release

This release contains the enhanced OpenSES executables with increased parameter limits for larger subway system simulations.

## Contents

- **OpenSES_v4.2** - Linux executable (enhanced version with increased limits)
- **OpenSES_v4.2.exe** - Windows executable (enhanced version with increased limits)

## Compatibility

- Linux executable: Compatible with Linux x86-64 systems
- Windows executable: Compatible with Windows x86-64 systems

## Enhanced Features

This version includes increased parameter limits for larger models:
- Up to 3600 sections (vs 900 in original)
- Up to 2400 aerodynamic and thermodynamic nodes each (vs 600 in original)
- Up to 2480 line segments (vs 620 in original)
- Up to 1624 ventilation shafts (vs 406 in original)
- Up to 300 environmental control zones (vs 75 in original)
- Up to 300 operational trains (vs 75 in original) of 64 types (vs 16 in original)
- Up to 80 train routes (vs 20 in original)
- Up to 300 fan types (vs 75 in original)
- Up to 200 unsteady heat sources (vs 50 in original)
- Up to 100 print groups (vs 25 in original)
- Up to 2000 flow loops (vs 500 in original)

## Usage

### Linux:
```bash
./OpenSES_v4.2 input_file.inp
```

### Windows:
```cmd
OpenSES_v4.2.exe input_file.inp
```

## Documentation

For detailed usage instructions, refer to the main OpenSES documentation.