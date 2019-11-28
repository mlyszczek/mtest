PREFIX ?= "/usr/local"
MANDIR = $(PREFIX)/share/man
INCDIR = $(PREFIX)/include

install:
	install -m 0644 -D -t $(DESTDIR)$(INCDIR) mtest.h
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man7 man/mtest_overview.7
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_assert.3
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_defs.3
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_defs_ext.3
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_fail.3
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_fok.3
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_ferr.3
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_assert.3
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_return.3
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_run.3
	install -m 0644 -D -t $(DESTDIR)$(PREFIX)/man3 man/mt_run_named.3

www:
	./www/gen-download-page.sh
	./www/man2html.sh
	$(MAKE) -C www

clean:
	$(MAKE) clean -C www
	$(MAKE) clean -C example

dist: clean
	./dist.sh

.PHONY: www clean dist install
