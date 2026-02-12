#!/bin/bash
# Script to build Windows executable with increased limits

set -e  # Exit on any error

echo "Building OpenSES Windows executable with increased limits..."

# Create temporary directory for enhanced build
mkdir -p win64_enhanced_temp
cd win64_enhanced_temp

# Copy all source files and include files
cp ../*.FOR ./
cp ../DSHARE ../DSHRHS ../HEATUC ../RECORD.TXT ../JULIEC ./  # Copy necessary include files
# The DSHARE with increased limits is already copied and will be used

# Create object files list
OBJECTS=""
for src in *.FOR; do
    obj="${src%.FOR}.o"
    OBJECTS="$OBJECTS ${obj}"
done

# Compile all source files with the enhanced DSHARE
echo "Compiling source files..."
for src in *.FOR; do
    obj="${src%.FOR}.o"
    echo "Compiling $src..."
    x86_64-w64-mingw32-gfortran -falign-commons -Wno-align-commons -std=legacy -c "$src" -o "$obj"
done

# Link the executable
echo "Linking executable..."
mkdir -p win64_enhanced
x86_64-w64-mingw32-gfortran -o win64_enhanced/OpenSES_v4.2.exe $OBJECTS -static

echo "Windows executable with increased limits built successfully!"
echo "Location: win64_enhanced/OpenSES_v4.2.exe"

# Return to original directory
cd ..