cmake_minimum_required(VERSION 3.16)
project(cubesat_adcs_gnc CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(adcs_sim src/main.cpp)
target_include_directories(adcs_sim PRIVATE include)

enable_testing()
add_subdirectory(tests)
