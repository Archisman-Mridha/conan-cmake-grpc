cmake_minimum_required(VERSION 3.15)
project(ConanGrpcDemo
  VERSION 1.0.0
  LANGUAGES C CXX)

find_package(Catch2 REQUIRED)
find_package(gRPC REQUIRED)

include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

add_subdirectory("./src/generated/proto/")

# Represents the ./src/main.cpp file
set(EXECUTABLE_NAME "main")
add_executable(${EXECUTABLE_NAME} src/main.cpp)
# Link gRPC C++ library with main.cpp
target_link_libraries(${EXECUTABLE_NAME} PRIVATE
  gRPC::grpc++ gRPC::grpc++_reflection
  protoc_generated)