# Compiler and flags
CC = gcc
CXX = g++
CFLAGS = -Wall -Wextra -pedantic -Iinclude
LDFLAGS = -pthread
GTEST_DIR = googletest
GTEST_SRC = $(GTEST_DIR)/googletest/src/gtest-all.cc
GTEST_HEADERS = $(GTEST_DIR)/googletest/include/gtest/*.h

# Source files and objects
SRC = src/sensor.c src/utils.c
OBJ = $(SRC:.c=.o)
TEST_SRC = tests/test_main.cpp
TEST_OBJ = $(TEST_SRC:.cpp=.o)

# Targets
all: main tests

main: main.c $(OBJ)
	$(CC) $(CFLAGS) -o main main.c $(OBJ)

tests: $(TEST_OBJ) $(OBJ) gtest_main.o
	$(CXX) $(LDFLAGS) -o tests/test_main $(TEST_OBJ) $(OBJ) gtest_main.o

gtest_main.o:
	$(CXX) $(CFLAGS) -isystem $(GTEST_DIR)/googletest/include -I$(GTEST_DIR) \
		-c $(GTEST_SRC) -o gtest_main.o

clean:
	rm -f main tests/test_main gtest_main.o $(OBJ) $(TEST_OBJ)
