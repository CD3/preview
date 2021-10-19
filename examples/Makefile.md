.PHONY: logfile
logfile:
	@echo ./preview.log

.PHONY: build
build:
	pandoc -f markdown -t latex -o $(TMPDIR)/$(INFILE_STEM).pdf $(INFILE) || zenity --error --no-markup --text="There was a problem building the preview.\nCommand output was saved to $(LOGFILE)."

.PHONY: setup
setup: build

.PHONY: start
start:
	zathura $(TMPDIR)/$(INFILE_STEM).pdf 1>/dev/null 2>/dev/null

.PHONY: refresh
refresh: build

.PHONY: stop
stop:

.PHONY: cleanup
cleanup:

