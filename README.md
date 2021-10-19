# `preview`

`preview` is a simple bash script that allows you to preview a file/document/image that is generated from a source file. For example, if you are
writing a Markdown file and you want to see a preview of what it will look like in HTML. There are many situations when this is useful, here are
a just a few of the situations that motivated this script

- Markdown : The most common scenario. I use `vim` and couldn't find a good markdown previewer that I liked.
- gnuplot : It is nice to be able to see a preview of a plot generated with gnuplot while editing the script.
- Latex Snippets : I use LaTeX/circuitikz to create circuit diagrams and `tex2im` to create the image files. `preview` lets me see the image while I edit the LaTeX.

## What it does

`preview` uses `entr` to trigger commands when a file is updated. A `Makefile` is used to trigger the commands, so it is completely customizable. All that
is needed for preview to work is a `Makefile` that contains 3 targets (it may define more that 3, but these are the three that will be used).

- setup : `make setup` is ran before the view process is started.
- start : `make start` is ran to start a process for viewing the preview (i.e. a PDF viewer or browser).
- refresh : `make refresh` is ran every time the source file is modified (using `entr`).
- stop : `make stop` is ran when `preview` recieves a `SIGTERM` (i.e. ctrl-c).
- cleanup : `make cleanup` is ran after the processes started by `make start` terminates.

`preview` simply does a little bit of work so that a build and refresh occur when the source file being "previewed" is modified, so the preview
can be updated automatically.

## Makefiles

`preview` looks for a `Makefile` to use in several different places. The following files are looked for in the order listed. The first one found is
used:

- A file named `Makefile.${ext}`, where `${ext}` is the extension of the source file, in the directory of the source file.
- A file named `Makefile.${ext}`, where `${ext}` is the extension of the source file, in the directory `~/.preview`.
- A file named `Makefile` in the directory of the source file.
- A file named `Makefile` in the directory `~/.preview`.

If no `Makefile` can be found, then a default `Makefile` (stored in the script itself) is used. The default `Makefile` previews Markdown using
`pandoc` to generate PDF file and opens it using the `zathura` PDF viewer.
