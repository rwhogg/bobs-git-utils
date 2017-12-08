.phony: install

dummy:
	true # keep dpkg-buildpackage happy

install:
	mkdir -p $(DESTDIR)/usr/bin
	install git-* $(DESTDIR)/usr/bin
