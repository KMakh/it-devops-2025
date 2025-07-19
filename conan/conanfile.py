from conan import ConanFile
from conan.tools.cmake import CMake, cmake_layout, CMakeDeps

class HelloConan(ConanFile):
    name = "hello_conan"
    version = "1.0"
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"

    def requirements(self):
        self.requires("fmt/10.2.1")

    def layout(self):
        cmake_layout(self)

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
