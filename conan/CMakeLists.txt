cmake_minimum_required(VERSION 3.23)
project(hello_conan CXX)

find_package(fmt REQUIRED)

add_executable(hello_conan src/main.cpp)

target_link_libraries(hello_conan PRIVATE fmt::fmt)
