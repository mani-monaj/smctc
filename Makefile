.PHONY: docs clean distclean examples

default: libraries examples

all: libraries docs examples

clean:
	make -Csrc clean
	make -Cexamples clean
	-rm *~
	-rm */*~

distclean: clean
	-rm bin/*
	-rm lib/*
	-rm -Rf doc/*

libraries:
	make -Csrc all

docs:
	make -Csrc/doxygen all
	make -Cdoc/latex  all
	cp doc/latex/refman.pdf doc

examples:
	make -Cexamples all


dist: distclean
	tar -cf ../smctc.tar *
	bzip2 ../smctc.tar
	tar -cf ../smctc.tar *
	zip -r ../smctc.zip *

style:
	astyle  -A3 \
		--pad-oper \
		--unpad-paren \
		--keep-one-line-blocks \
		--keep-one-line-statements \
		--suffix=none \
		--formatted \
		--lineend=linux \
		`find . -regextype posix-extended -regex ".*\.(cc|hh)"`

.PHONY:

default: all, clean, distclean, libraries, docs, examples, dist, style


