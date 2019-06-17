H5PART_ROOT=/root/repos/h5part/build/

CFLAGS  = -DPARALLEL_IO -I$(H5PART_ROOT)/include -I/usr/include/mpich -I/hdf5/build/include
LDFLAGS = -L$(H5PART_ROOT)/lib 
LDLIBS  = -lH5Part -lhdf5 -lmpi

.PHONY: all clean

BINARIES = vpicio_uni vpicio_uni_dyn

all: $(BINARIES)

vpicio_uni_dyn: LDFLAGS += -dynamic
vpicio_uni_dyn: vpicio_uni.o
	$(CC) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@

clean:
	rm -f *.o $(BINARIES)
