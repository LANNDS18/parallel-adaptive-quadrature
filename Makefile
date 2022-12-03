# Makefile for Coursework Part 2

#
# C compiler and options for Intel
#
#CC=     icc -O3 -qopenmp -std=c99
#LIB=    -lm

#
# C compiler and options for GNU 
#
CC=		gcc -O3 -Xpreprocessor -fopenmp
# CC=     gcc -O3 -fopenmp
LIB=	-lm -lomp

#
# Object files
#

OBJ1=    solver1.o function.o

OBJ2=    solver2.o function.o

OBJ3=    solver1_limitdepth.o function.o

OBJ4=    solver2_multiqueue.o function.o

#
# Compile
#

all: solver1 solver2 solver2_multiqueue solver1_limitdepth

solver1:   $(OBJ1)
	$(CC) -o $@ $(OBJ1) $(LIB)

solver2:   $(OBJ2)
	$(CC) -o $@ $(OBJ2) $(LIB)

solver1_limitdepth:   $(OBJ3)
	$(CC) -o $@ $(OBJ3) $(LIB)

solver2_multiqueue:   $(OBJ4)
	$(CC) -o $@ $(OBJ4) $(LIB)

.c.o:
	$(CC) -c $<

#
# Clean out object files and the executable.
#
clean:
	rm *.o solver1 solver2 solver1_limitdepth solver2_multiqueue
