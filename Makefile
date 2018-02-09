.phony: install

DESTDIR=/usr/local
bindir=bin

dummy:
	true # keep dpkg-buildpackage happy

install:
	mkdir -p $(DESTDIR)/$(bindir)
	install bin/git-* $(DESTDIR)/$(bindir)
