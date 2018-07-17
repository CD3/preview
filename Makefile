DESTDIR=~
install:
	cp preview $(DESTDIR)/bin
	mkdir -p ~/.preview
	cp examples/Makefile* ~/.preview
