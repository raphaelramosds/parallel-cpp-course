CXX=g++

CXXFLAGS=-O3 -fopenmp --std=c++20

LDFLAGS= -lbenchmark -lpthread -ltbb

TARGETS= \
	0_baseline.out \
	1_openmp.out \
	2_openmp_cpp11.out \
	3_tbb.out

%.out: %.cpp
	$(CXX) $< -o $@ $(CXXFLAGS) $(LDFLAGS)

all: $(TARGETS)

clean:
	rm -f $(TARGETS)