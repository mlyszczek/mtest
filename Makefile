PREFIX ?= "/usr/local"
MANDIR = $(PREFIX)/share/man
INCDIR = $(PREFIX)/include
VERSION=1.4.0
DISTDIR ?= mtest-$(VERSION)
MKDIR ?= mkdir
RM ?= rm -f

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

$(DISTDIR):
	$(RM) -r $(DISTDIR)
	mkdir $(DISTDIR)
	cp LICENSE Makefile readme.md mtest.h mtest.sh $(DISTDIR)
	mkdir $(DISTDIR)/example
	cp example/add-tests.c example/add-tests.h example/calc.c $(DISTDIR)/example
	cp example/calc.h example/named-tests.c example/named-tests.h $(DISTDIR)/example
	cp example/param-tests.c example/param-tests.h example/readme.md $(DISTDIR)/example
	cp example/sub-tests.c example/sub-tests.h example/tests.c $(DISTDIR)/example
	cp example/Makefile $(DISTDIR)/example
	mkdir $(DISTDIR)/www
	cp www/Makefile www/custom.css www/downloads.html www/footer.in $(DISTDIR)/www
	cp www/gen-download-page.sh www/header.in www/index.in $(DISTDIR)/www
	cp www/index.md www/man2html.sh $(DISTDIR)/www
	mkdir $(DISTDIR)/man
	cp man/mt_assert.3 man/mt_defs.3 man/mt_defs_ext.3 man/mt_fail.3 $(DISTDIR)/man
	cp man/mt_ferr.3 man/mt_fok.3 man/mt_return.3 man/mt_run.3 $(DISTDIR)/man
	cp man/mt_run_named.3 man/mtest_overview.7 $(DISTDIR)/man

dist: $(DISTDIR).tar.gz
$(DISTDIR).tar.gz: $(DISTDIR)
	tar czf $@ $<

$(DISTDIR).tar.bz2: $(DISTDIR)
	tar cjf $@ $<

$(DISTDIR).tar.xz: $(DISTDIR)
	tar cJf $@ $<

dist-all: $(DISTDIR).tar.gz $(DISTDIR).tar.bz2 $(DISTDIR).tar.xz

distclean: clean
	$(RM) -r mtest-*

distcheck: $(DISTDIR).tar.gz
	$(RM) -r $(DISTDIR)
	tar xzf $(DISTDIR).tar.gz
	$(MKDIR) $(DISTDIR)/install
	DESTDIR=install $(MAKE) -C $(DISTDIR) install
	$(MAKE) -C $(DISTDIR) distclean

.PHONY: www clean dist install
