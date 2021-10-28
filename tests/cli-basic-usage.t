  $ $TESTDIR/../preview --help | head -n 1
  'preview' .* (re)


  $ $TESTDIR/../preview | head -n 1
  Usage: .* (re)


  $ mkdir preview
  $ touch preview/Makefile.md
  $ touch preview/Makefile.gp
  $ ls
  preview
  $ ls preview
  Makefile.gp
  Makefile.md
  $ $TESTDIR/../preview --config-dir ./preview --local-link md:md
  $ ls
  Makefile.md
  preview


  $ $TESTDIR/../preview --config-dir ./preview --local-link markdown:md
  $ ls
  Makefile.markdown
  Makefile.md
  preview


  $ touch source.md
  $ $TESTDIR/../preview source.md
  make: *** No rule to make target 'setup'.  Stop.
  make: *** No rule to make target 'start'.  Stop.
  make: *** No rule to make target 'refresh'.  Stop.
  make: *** No rule to make target 'cleanup'.  Stop.
  [2]


  $ cat > Makefile.md << EOF
  > setup:
  > start:
  > refresh:
  > stop:
  > cleanup:
  > EOF
  $ $TESTDIR/../preview source.md
  $ $TESTDIR/../preview -v source.md
  make: Nothing to be done for 'setup'.
  make: Nothing to be done for 'start'.
  make: Nothing to be done for 'refresh'.
  make: Nothing to be done for 'cleanup'.


  $ cat > Makefile.md << EOF
  > setup:
  > 	@echo setup
  > start:
  > 	@echo starting > /dev/stderr
  > refresh:
  > 	@:
  > stop:
  > 	@:
  > cleanup:
  > 	@:
  > EOF
  $ $TESTDIR/../preview source.md
  starting
  $ $TESTDIR/../preview -v source.md
  setup
  starting
  $ $TESTDIR/../preview -v -v source.md | head -n 1
  [debug] Using * (glob)
  $ $TESTDIR/../preview -d source.md | head -n 1
  [debug] Using * (glob)
