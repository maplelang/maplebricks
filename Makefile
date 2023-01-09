LDLIBS = -lSDL2 -lSDL2_image

bricks: bricks.o

%.o: %.m
	mpc -o $@ $^

clean:
	rm -f bricks *.o

.PHONY: clean
