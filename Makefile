# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -pedantic -g

# Google Test configuration
GTEST_DIR = ./googletest
GTEST_INCLUDE = $(GTEST_DIR)/include
GTEST_LIB = $(GTEST_DIR)/build

# Source and test files
SRC = src/sensor.cpp src/utils.cpp
TEST_SRC = tests/test_main.cpp
OBJ = $(SRC:.cpp=.o)
TEST_OBJ = tests/test_main.o
TEST_EXEC = tests/test_executable

# Valgrind and AddressSanitizer flags
ASAN_FLAGS = -fsanitize=address
VALGRIND_COMMAND = valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all

# Target: Build tests
all: $(TEST_EXEC)

# Compilation for the test executable
$(TEST_EXEC): $(OBJ) $(TEST_OBJ)
	$(CXX) $(CXXFLAGS) $(ASAN_FLAGS) -L$(GTEST_LIB) -lgtest -lgtest_main -o $@ $^

# Compilation for test object files
$(TEST_OBJ): $(TEST_SRC)
	$(CXX) $(CXXFLAGS) -I$(GTEST_INCLUDE) -c $< -o $@

# Compilation for source files
$(OBJ): $(SRC)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJ) $(TEST_OBJ) $(TEST_EXEC)

# Run tests using Valgrind for memory checking
valgrind: $(TEST_EXEC)
	$(VALGRIND_COMMAND) ./$(TEST_EXEC)

# Run tests with AddressSanitizer (for detecting runtime memory issues)
asan: $(TEST_EXEC)
	./$(TEST_EXEC)
