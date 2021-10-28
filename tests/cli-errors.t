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

  $ ln -s $(which cat) bin/cat
  $ PATH="$PWD/bin" $TESTDIR/../preview | head -n 1
  Usage: .* (re)

