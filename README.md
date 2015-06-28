# Broken

The Broken project aims at delivering an easy-to use testing framework
for OCaml.

It is written by Michael Grünewald and is distributed under the
[CeCILL-B][1] license agreement.


## Setup guide

The installation procedure is based on the portable build system
[BSD Owl Scripts][bsdowl-home] based on BSD Make.

1. Verify that prerequisites are installed:
   - BSD Make
   - [BSD OWl][bsdowl-install]
   - OCaml
   - GNU Autoconf

2. Get the source, either by cloning the repository or by exploding a
   [distribution tarball](releases).

3. Optionally run `autoconf` to produce a configuration script. This
   is only required if the script is not already present.

4. Run `./configure`, you can choose the installation prefix with
   `--prefix`.

5. Run `make build`.

6. Optionally run `make test` to test your build.

7. Finally run `make install`.

Depending on how **BSD Make** is called on your system, you may need to
replace `make` by `bsdmake` or `bmake` in steps 5, 6, and 7.
The **GNU Make** program usually give up the ghost, croaking
`*** missing separator. Stop.` when you mistakingly use it instead of
**BSD Make**.

Step 7 requires that you can `su -` if you are not already `root`.


Michael Grünewald in Berlin, on June 28, 2015

   [bsdowl-home]:       https://github.com/michipili/bsdowl
   [bsdowl-install]:    https://github.com/michipili/bsdowl/wiki/Install
