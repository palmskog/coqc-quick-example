COQPROJECT_EXISTS=$(wildcard _CoqProject)

ifeq "$(COQPROJECT_EXISTS)" ""
$(error "Run ./configure before running make")
endif

default: Makefile.coq
	time -v -p sh -c 'make -f Makefile.coq quick && coqc -q  -Q "." "" -schedule-vio-checking 1 alternate_correct.vio'

Makefile.coq: _CoqProject
	coq_makefile -f _CoqProject -o Makefile.coq

clean:
	$(MAKE) -f Makefile.coq clean
	rm Makefile.coq

.PHONY: default clean
