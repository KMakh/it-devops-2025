#!/bin/sh
cmake ..
cmake --build . | tee build.log
cp ./build.log ./libsqlite3.so ../output
