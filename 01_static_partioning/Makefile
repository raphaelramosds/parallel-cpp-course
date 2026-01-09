CXX = g++

# Flags de compilacao
CXXFLAGS = -O3 --std=c++20

# Flags de linking
LDFLAGS = -lpthread

TARGETS = \
    0_coarse_grained.out \
    1_fine_grained.out

%.out: %.cpp
	$(CXX) $< -o $@ $(CXXFLAGS) $(LDFLAGS)

all: $(TARGETS)

clean:
	rm -f $(TARGETS)