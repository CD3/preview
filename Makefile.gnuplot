outfile:
	@echo $(basename $(INFILE)).png

build:
	pictify.sh $(INFILE)

view:
	vimb -s -d file://$(OUTFILE) 1>$(TMPDIR)/_socket 2>/dev/null

refresh:
	echo ':o file://$(OUTFILE)<CR>' | socat - UNIX-CONNECT:`tail -n 1 $(TMPDIR)/_socket`
