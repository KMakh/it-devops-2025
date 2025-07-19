#!/bin/bash

rm -rf build
mkdir -p build

echo "Installing Conan dependencies..."
conan install . --output-folder=build --build=missing

cd build

echo "Configuring with CMake..."
cmake .. -DCMAKE_TOOLCHAIN_FILE=build/Release/generators/conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release

echo "Building..."
cmake --build .

cd ..

echo "Build completed!"
echo "You can run the executable with: ./build//hello_conan"
