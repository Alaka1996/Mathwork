CXX = g++
CXXFLAGS = -Wall -Wextra -pedantic
GTEST_DIR = ./googletest
GTEST_INCLUDE = $(GTEST_DIR)/include
GTEST_LIB = $(GTEST_DIR)/build

TEST_SRC = tests/test_main.cpp
TEST_OBJ = tests/test_main.o
TEST_EXEC = tests/test_executable

all: $(TEST_EXEC)

$(TEST_EXEC): $(TEST_OBJ)
    $(CXX) $(CXXFLAGS) -L$(GTEST_LIB) -lgtest -lgtest_main -o $@ $^

$(TEST_OBJ): $(TEST_SRC)
    $(CXX) $(CXXFLAGS) -I$(GTEST_INCLUDE) -c $< -o $@

clean:
    rm -f $(TEST_OBJ) $(TEST_EXEC)
