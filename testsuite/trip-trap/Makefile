### Makefile -- Broken

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

PROGRAM=		unit_testing
SRCS+=			main.ml

EXTERNAL=		ocaml.findlib:unix

TESTS=			test-help-screen
TESTS+=			test-suites-list
TESTS+=			test-expected-failures-list

test-help-screen.got: ${PROGRAM}
	./${PROGRAM} -h 2> ${.TARGET}

test-suites-list.got: ${PROGRAM}
	./${PROGRAM} -l > ${.TARGET}

test-expected-failures-list.got: ${PROGRAM}
	./${PROGRAM} -x > ${.TARGET}

.include "broken.trip-trap.mk"

### End of file `Makefile'
