.PHONY: logfile
logfile:
	@echo $(INDIR)/preview.log

.PHONY: build
build:
	pandoc -f markdown -t latex -o $(OUTFILE).pdf $(INFILE) || zenity --error --no-markup --text="There was a problem building the preview.\nCommand output was saved to $(LOGFILE)"

.PHONY: view
view:
	zathura $(OUTFILE).pdf 1>/dev/null 2>/dev/null

.PHONY: refresh
refresh:
