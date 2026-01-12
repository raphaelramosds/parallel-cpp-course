CXX = g++

# Flags de compilacao
CXXFLAGS = -O3 --std=c++20

# Flags de linking
LDFLAGS = -lpthread

TARGETS = \
    0_static.out \
    1_dynamic.out \
	2_dynamic.out

%.out: %.cpp
	$(CXX) $< -o $@ $(CXXFLAGS) $(LDFLAGS)

all: $(TARGETS)

clean:
	rm -f $(TARGETS)