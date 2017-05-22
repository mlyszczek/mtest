DESTDIR ?= "/usr/local"

install:
	install -m 0644 -D -t $(DESTDIR)/include mtest.h
