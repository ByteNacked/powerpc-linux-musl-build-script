all:
	powerpc-linux-musl-gcc libunwind.c -c -o libunwind.o
	powerpc-linux-musl-ar rcs libunwind.a libunwind.o

clean c:
	-rm libunwind.a libunwind.o

