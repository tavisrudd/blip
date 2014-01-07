# Copyright   : (c) 2012, 2013 Bernie Pope
# License     : BSD-style
# Maintainer  : florbitous@gmail.com

# A convenience Makefile.

.PHONY: all configure clean install
all configure clean install:
	$(MAKE) $@ --directory=lib
	$(MAKE) $@ --directory=compiler
	$(MAKE) $@ --directory=readpyc
	$(MAKE) $@ --directory=interpreter

.PHONY: test
test:
	shelltest --color --execdir test/regression -- -j1
