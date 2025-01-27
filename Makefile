# Compiler and flags
CC = gcc
CXX = g++
CFLAGS = -Wall -Wextra -pedantic -Iinclude
GTEST_DIR = googletest
GTEST_LIB = $(GTEST_DIR)/build/lib/libgtest.a $(GTEST_DIR)/build/lib/libgtest_main.a

# Source files and objects
SRC = src/sensor.c src/utils.c
OBJ = $(SRC:.c=.o)

# Targets
all: main tests

# Build main executable
main: main.c $(OBJ)
	$(CC) $(CFLAGS) -o main main.c $(OBJ)

# Build and link GoogleTest-based tests
tests: tests/test_main.cpp $(OBJ)
	mkdir -p $(GTEST_DIR)/build
	cd $(GTEST_DIR) && cmake -S . -B build
	make -C $(GTEST_DIR)/build
	$(CXX) -std=c++17 -isystem $(GTEST_DIR)/googletest/include -Iinclude \
        -pthread $(OBJ) tests/test_main.cpp $(GTEST_LIB) -o tests/test_main

# Run tests
run-tests: tests
	./tests/test_main

# Run cppcheck
cppcheck:
	cppcheck --enable=all --inconclusive --std=c99 --suppress=missingIncludeSystem .

# Clean up
clean:
	rm -f main tests/test_main $(OBJ)

.PHONY: all clean cppcheck run-tests
