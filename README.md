# Broken

The **Broken** project aims at delivering an easy-to use testing framework
for OCaml.

[![Build Status](https://travis-ci.org/michipili/broken.svg?branch=master)](https://travis-ci.org/michipili/broken?branch=master)


## Example of tests

This shows how to create a testsuite `example` containing two test
cases `opposite` and `not_found` testing for some computation
returning the value 0 and some other to raise the `Not_found`
exception:

```ocaml
suite "example" "Example of unit tests" [

  assert_zero "opposite"
    (fun (a,b) -> a - b) (1,1);

  assert_exception "not_found"
    Not_found (fun x -> List.mem x []) 0;
]
```

This is a more advanced example, illustrating the use of a custom
test-case function `assert_maybe_string`, which is specialised in the
production of test-cases for computations yielding string options,
that is, computations in the so called *maybe string monad*.


```ocaml
suite "maybe" "Test the maybe monad" [

  assert_maybe_string "map"
    (Maybe.map String.uppercase) (Some "a") (Some "A");

  assert_maybe_string "map_infix"
    (Maybe.Infix.( <$> ) String.uppercase) (Some "a") (Some "A");

  assert_maybe_string "apply"
    (Maybe.apply (Some(String.uppercase))) (Some "a") (Some "A");

  assert_maybe_string "apply_infix"
    (Maybe.Infix.( <*> ) (Some(String.uppercase))) (Some "a") (Some "A");

  assert_maybe_string "apply_left_1"
    (Maybe.Infix.( <* ) None) (Some "b") None;

  assert_maybe_string "apply_left_2"
    (Maybe.Infix.( <* ) (Some "a")) (Some "b") (Some "a");

  assert_maybe_string "apply_right_1"
    (Maybe.Infix.( >* ) None) (Some "b") None;

  assert_maybe_string "apply_right_2"
    (Maybe.Infix.( >* ) (Some "a")) (Some "b") (Some "b");
];
```

The custom function `assert_maybe_string` is defined by

```ocaml
let assert_maybe_string id ?expected_failure f a b =
  assert_equal
    id
    ?expected_failure
    ~printer:(Maybe.format Format.pp_print_string)
    ~equal:( (=) )
    f a b
```
The [full example][mixture-test] can be found as part of the
[Mixture][mixture-home] library.


## Free software

It is written by Michael Grünewald and is distributed as a free
software: copying it  and redistributing it is
very much welcome under conditions of the [CeCILL-B][licence-url]
licence agreement, found in the [COPYING][licence-en] and
[COPYING-FR][licence-fr] files of the distribution.


## Setup guide

It is easy to install **Broken** using **opam** and its *pinning*
feature.  In a shell visiting the repository, say

```console
% opam pin add broken .
```

It is also possible to install **Broken** manually.
The installation procedure is based on the portable build system
[BSD Owl Scripts][bsdowl-home] written for BSD Make.

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

  [licence-url]:        http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html
  [licence-en]:         COPYING
  [licence-fr]:         COPYING-FR
  [bsdowl-home]:        https://github.com/michipili/bsdowl
  [bsdowl-install]:     https://github.com/michipili/bsdowl/wiki/Install
  [mixture-home]:       https://github.com/michipili/mixture
  [mixture-test]:       https://github.com/michipili/mixture
