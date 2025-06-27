# Makefile for OpenGL + GLFW + GLAD project

# sets compiler
CXX = g++

# -W means show all warnings
# -I means look for headers in include folder (where glad.h is)
# -L tells the linker to look in /usr/local/lib (where libglfw.so is)
CXXFLAGS = -Wall -Iinclude -L/usr/local/lib
# these are obviously the flags
# -lglfw is the glfw windowing lib
# -lGL is the openGL system library
# -ldl means dynamic loading, used by GLAD
# -lm is the math library (standard in gpx code)
LDFLAGS = -lglfw -lGL -ldl -lm

# obviously the source files and destination target
SRC = hello_window.cpp glad.c
TARGET = hello_window

# default target
all: $(TARGET)

# defines how to build TARGET from SRC
# $^ means all dependencies (SRC)
# $@ means "the target" (first thing in SRC above)
# command under rule must have a real tab, not just spaces
$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

# you can run "make clean" to delete binary and start afresh
# -f means don't cmplain if the file doesn't exist
clean:
	rm -f ($TARGET)
