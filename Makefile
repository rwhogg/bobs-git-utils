.phony: install dummy deb

prefix=/usr/local
exec_prefix=$(prefix)
bindir=$(exec_prefix)/bin
datarootdir=$(prefix)/share
mandir=$(datarootdir)/man
man1dir=$(mandir)/man1
manext=.1

dummy: docs
	true # keep dpkg-buildpackage happy

docs:
	scdoc < man/man1/git-unchange.1.scd > man/man1/git-unchange.1

install:
	mkdir -p $(DESTDIR)/$(bindir)
	mkdir -p $(DESTDIR)/$(man1dir)
	install bin/git-* $(DESTDIR)/$(bindir)
	install man/man1/*.1 $(DESTDIR)/$(man1dir)

deb:
	nfpm pkg -p deb

rpm:
	nfpm pkg -p rpm

