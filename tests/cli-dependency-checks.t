  $ $TESTDIR/../preview missing.md
  [error] Input file 'missing.md' does not exist or is not a file.
  [1]

  $ mkdir bin
  $ ln -s $(which which) bin/which
  $ PATH="$PWD/bin" $TESTDIR/../preview
  'entr' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which entr) bin/entr
  $ PATH="$PWD/bin" $TESTDIR/../preview
  'make' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which make) bin/make
  $ PATH="$PWD/bin" $TESTDIR/../preview
  'getopt' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which getopt) bin/getopt
  $ PATH="$PWD/bin" $TESTDIR/../preview
  'mktemp' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which mktemp) bin/mktemp
  $ PATH="$PWD/bin" $TESTDIR/../preview
  'readlink' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which readlink) bin/readlink
  $ PATH="$PWD/bin" $TESTDIR/../preview
  'dirname' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which dirname) bin/dirname
  $ PATH="$PWD/bin" $TESTDIR/../preview
  'basename' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which basename) bin/basename
  $ PATH="$PWD/bin" $TESTDIR/../preview
  'cat' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ cat > Makefile.md << EOF
  > setup:
  > 	@:
  > start:
  > 	@:
  > refresh:
  > 	@:
  > cleanup:
  > 	@:
  > EOF
  $ touch test.md

  $ ln -s $(which cat) bin/cat
  $ PATH="$PWD/bin" $TESTDIR/../preview
  'ps' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which ps) bin/ps
  $ PATH="$PWD/bin" $TESTDIR/../preview test.md
  'tee' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which tee) bin/tee
  $ PATH="$PWD/bin" $TESTDIR/../preview test.md
  'sleep' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which sleep) bin/sleep
  $ PATH="$PWD/bin" $TESTDIR/../preview test.md
  'grep' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which grep) bin/grep
  $ PATH="$PWD/bin" $TESTDIR/../preview test.md
  'sed' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which sed) bin/sed
  $ PATH="$PWD/bin" $TESTDIR/../preview test.md
  'awk' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which awk) bin/awk
  $ PATH="$PWD/bin" $TESTDIR/../preview test.md
  'ln' is required to run 'preview' but was not found. Please install it and run again.
  [1]

  $ ln -s $(which ln) bin/ln

  $ PATH="$PWD/bin" $TESTDIR/../preview test.md

  $ mkdir preview
  $ mv Makefile.md preview
  $ PATH="$PWD/bin" $TESTDIR/../preview --config-dir preview --local-link md:md
