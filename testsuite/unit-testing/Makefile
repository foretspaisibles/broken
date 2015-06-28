### Makefile -- Test suite

# Broken (https://github.com/michipili/broken)
# This file is part of Broken
#
# Copyright © 2014–2015 Michael Grünewald
#
# This file must be used under the terms of the CeCILL-B.
# This source file is licensed as described in the file COPYING, which
# you should have received as part of this distribution. The terms
# are also available at
# http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.txt

PROGRAM=		unit-testing

SRCS+=			testBroken.ml
SRCS+=			main.ml

OCAMLLFLAGS+=		-linkall

do-test: build
	./unit-testing

.include "ocaml.prog.mk"

### End of file `Makefile'
