CXX = g++
CXXFLAGS = -Iinclude -std=c++17

SRC_DIR = src
INC_DIR = include
OBJ_DIR = build/obj
BUILD_DIR = build

SRCS = main.cpp $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(notdir $(SRCS)))
EXEC = $(BUILD_DIR)/main

all: $(EXEC)

$(EXEC): $(OBJS) | $(BUILD_DIR)
	$(CXX) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/main.o: main.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR) $(OBJ_DIR):
	mkdir -p $@

run: all
	./$(EXEC)

clean:
	rm -rf $(BUILD_DIR)
