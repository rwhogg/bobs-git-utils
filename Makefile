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
	ronn man/man1/*.1.ronn

install:
	mkdir -p $(DESTDIR)/$(bindir)
	mkdir -p $(DESTDIR)/$(man1dir)
	install bin/git-* $(DESTDIR)/$(bindir)
	install man/man1/*.1 $(DESTDIR)/$(man1dir)

deb:
	dpkg-buildpackage -uc -us
