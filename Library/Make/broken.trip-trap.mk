### broken.trip-trap.mk -- Trip-Trap testing

# Broken (https://github.com/michipili/broken)
# This file is part of Broken
#
# Copyright © 2014 Michael Grünewald
#
# This file must be used under the terms of the CeCILL-B.
# This source file is licensed as described in the file COPYING, which
# you should have received as part of this distribution. The terms
# are also available at
# http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.txt

# Variables:
#
# TESTENV
#  Environment variables to be passed to the test programs
#
#   The value of the TESTENV variable should be a valid argument for
#   `env(1)', for instance
#
#     TESTENV=	LANG=en_US.UTF-8 LC_COLLATE=C

.SUFFIXES: .expected .got

install:
	${NOP}

do-clean: do-clean-log

do-clean-log:
	${RM} -f *.log

.for test in ${TESTS}
CLEANFILES+=		${test}.got

test: do-${test}

.if !target(do-${test})
do-${test}: ${test}.expected ${test}.got
	diff -u ${.ALLSRC:M*.expected} ${.ALLSRC:M*.got}
.endif
.endfor

.include "ocaml.prog.mk"

### End of file `broken.trip-trap.mk'
