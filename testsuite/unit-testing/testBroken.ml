(* TestBroken -- Testing our unit testing framework

Broken (https://github.com/michipili/broken)
This file is part of Broken

Copyright © 2014–2015 Michael Grünewald

This file must be used under the terms of the CeCILL-B.
This source file is licensed as described in the file COPYING, which
you should have received as part of this distribution. The terms
are also available at
http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.txt *)

open Broken

let () =
  suite "success" "Test assert_success"
    (List.map assert_success [ "a"; "b"; "c"; ]);
  suite "equal" "Test assert_equal" [
    assert_equal "a"
      ~printer:Format.pp_print_int
      (fun z -> z) 1 1
  ];
  package "broken" "Test all broken features" [
    "equal";
    "success";
  ]
