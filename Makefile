DESTDIR=~
install:
	cp preview $(DESTDIR)/bin
	mkdir -p ~/.preview
	cp dotpreview/Makefile* ~/.preview
