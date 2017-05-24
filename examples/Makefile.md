.PHONY: outfile
outfile:
	@echo $(TMPDIR)/$$( echo $(INFILE)  | sed 's|/|_|g' | sed 's|\.|_|g').pdf

.PHONY: build
build:
	@pandoc -f markdown_github -o $(OUTFILE) $(INFILE)

.PHONY: view
view:
	@zathura $(OUTFILE) 1>/dev/null 2>/dev/null

.PHONY: refresh
refresh:
