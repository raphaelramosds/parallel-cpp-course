CXX = g++
CXXFLAGS = -O3 -ltbb

TARGETS = \
	0_even_job_length/0_static.out \
	0_even_job_length/1_dynamic.out \
	1_uneven_job_length/0_static.out \
	1_uneven_job_length/1_dynamic.out

0_even_job_length/%: 0_even_job_length/%.cpp
	$(CXX) $< -o $@ $(CXXFLAGS)

1_uneven_job_length/%: 1_uneven_job_length/%.cpp
	$(CXX) $< -o $@ $(CXXFLAGS)

all: $(TARGETS)

clean:
	rm -f $(TARGETS)