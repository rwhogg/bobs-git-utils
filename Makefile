.phony: install dummy deb

prefix=/usr/local
exec_prefix=$(prefix)
bindir=$(exec_prefix)/bin
datarootdir=$(prefix)/share
mandir=$(datarootdir)/man
man1dir=$(mandir)/man1
manext=.1

dummy:
	true # keep dpkg-buildpackage happy

install:
	mkdir -p $(DESTDIR)/$(bindir)
	install bin/git-* $(DESTDIR)/$(bindir)

deb:
	dpkg-buildpackage -uc -us
