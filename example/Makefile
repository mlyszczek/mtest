SRCS = add-tests.c calc.c sub-tests.c tests.c named-tests.c param-tests.c \
		quick-tests.c
OBJS = $(SRCS:.c=.o)

all: example

clean:
	$(RM) *.o *~ example

example: $(OBJS)
	$(CC) -o example $(OBJS)

.c.o:
	$(CC) -c $< -o $@
