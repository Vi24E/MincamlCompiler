CXX = g++
CXXFLAGS = -Ofast -Wall -Wextra -std=c++17
LDFLAGS = -lncurses

TARGET = sim
SRCS = fastsim.cpp tui.cpp
OBJS = $(SRCS:.cpp=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(LDFLAGS)
	gcc -O2 -o tkasm v1.c
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
	rm tkasm
