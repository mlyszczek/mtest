DESTDIR ?= "/usr/local"

install:
	install -m 0644 -D -t $(DESTDIR)/include mtest.h
	install -m 0644 -D -t $(DESTDIR)/share/man/man7 man/man7/mtest_overview.7
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_assert.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_defs.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_defs_ext.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_fail.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_fok.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_ferr.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_assert.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_return.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_run.3
	install -m 0644 -D -t $(DESTDIR)/share/man/man3 man/man3/mt_run_named.3

www:
	./man2html.sh
	$(MAKE) -C www

clean:
	$(MAKE) clean -C www

.PHONY: www
