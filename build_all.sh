#!/bin/bash

# OpenSES v4.3a Build Script
# Builds both Linux and Windows versions with all optimization levels

set -e  # Exit on any error

echo "OpenSES v4.3a Build Script"
echo "==========================="
echo ""

# Check if we're in the right directory
if [ ! -f "source/makefile" ]; then
    echo "Error: makefile not found. Please run this script from the OpenSES root directory."
    exit 1
fi

# Check for required tools
echo "Checking for required tools..."

if ! command -v gfortran &> /dev/null; then
    echo "Error: gfortran not found. Please install gfortran."
    exit 1
fi

if ! command -v x86_64-w64-mingw32-gfortran &> /dev/null; then
    echo "Warning: x86_64-w64-mingw32-gfortran not found. Windows builds will fail."
    echo "To install on Ubuntu/Debian: sudo apt-get install gfortran-mingw-w64-x86-64"
    echo ""
fi

echo "Starting build process..."
echo ""

cd source

echo "Building Linux versions..."
echo "--------------------------"
make linux-all
echo ""

echo "Building Windows versions..."
echo "----------------------------"
make win-all || echo "Windows build failed - mingw compiler not available"
echo ""

echo "Build process completed!"
echo ""
echo "Linux executables:"
echo "  - builds/OpenSES_v4.3a_standard"
echo "  - builds/OpenSES_v4.3a_highperf"
echo "  - builds/OpenSES_debug"
echo ""
echo "Windows executables (if mingw available):"
echo "  - builds/OpenSES_v4.3a_standard.exe"
echo "  - builds/OpenSES_v4.3a_highperf.exe"
echo ""

echo "Build complete! Check BUILD_SYSTEM.md for more information."