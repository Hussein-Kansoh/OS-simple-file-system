CFLAGS = -c -g -ansi -pedantic -Wall -std=gnu99 `pkg-config fuse --cflags --libs`

LDFLAGS = `pkg-config fuse --cflags --libs`

# Uncomment on of the following three lines to compile
#SOURCES= sfs_api.c sfs_test0.c sfs_api.h
#SOURCES= sfs_api.c sfs_test1.c sfs_api.h
SOURCES= sfs_api.c sfs_test2.c sfs_api.h
#SOURCES= sfs_api.c fuse_wrap_old.c sfs_api.h
#SOURCES= sfs_api.c fuse_wrap_new.c sfs_api.h


OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=sfs

all: $(SOURCES) $(HEADERS) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	gcc $(OBJECTS) $(LDFLAGS) -o $@

.c.o:
	gcc $(CFLAGS) $< -o $@

clean:
	rm -rf *.o *~ $(EXECUTABLE)
