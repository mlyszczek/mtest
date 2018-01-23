DESTDIR ?= "/usr/local"

install:
	install -m 0644 -D -t $(DESTDIR)/include mtest.h
	install -m 0644 -D -t $(DESTDIR)/share/man/man7 man/mtest_overview.7
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_assert.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_defs.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_defs_ext.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_fail.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_fok.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_ferr.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_assert.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_return.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_run.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/mt_run_named.3

www:
	./man2html.sh
	$(MAKE) -C www

clean:
	$(MAKE) clean -C www

dist:
	./dist.sh

.PHONY: www clean dist install
