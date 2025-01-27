cmake_minimum_required(VERSION 3.10)

project(SensorDataTests)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)

# Include the directories for header files
include_directories(include)

# Add the source files
add_library(sensor_data src/sensor_data.c)

# Enable googletest
add_subdirectory(googletest)

# Create the test executable
add_executable(sensor_test test/test_sensor_data.cpp)

# Link googletest and sensor_data
target_link_libraries(sensor_test gtest gtest_main sensor_data)

# Enable testing
enable_testing()

# Add test to CTest
add_test(NAME SensorDataTests COMMAND sensor_test)
