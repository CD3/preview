logfile:
	@echo ./preview.log

build:
	pandoc -f markdown -t latex -o $(TMPDIR)/$(INFILE_STEM).pdf $(INFILE) || zenity --error --no-markup --text="There was a problem building the preview.\nCommand output was saved to $(LOGFILE)."

setup: build


start:
	zathura $(TMPDIR)/$(INFILE_STEM).pdf 1>/dev/null 2>/dev/null

refresh: build

stop:

cleanup:

