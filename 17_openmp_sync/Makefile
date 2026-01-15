CXX=g++

CXXFLAGS=-O3 -fopenmp --std=c++20

TARGETS= \
	0_critical.out \
	1_atomic.out \

%.out: %.cpp
	$(CXX) $< -o $@ $(CXXFLAGS) $(LDFLAGS)

all: $(TARGETS)

clean:
	rm -f $(TARGETS)