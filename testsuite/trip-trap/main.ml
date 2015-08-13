(* Main -- Unit testing

Broken (https://github.com/michipili/broken)
This file is part of Broken

Copyright © 2014–2015 Michael Grünewald

This file must be used under the terms of the CeCILL-B.
This source file is licensed as described in the file COPYING, which
you should have received as part of this distribution. The terms
are also available at
http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.txt *)

open Broken


module DatabaseOracle =
struct
  let () =
    register_suite "oracle" "Test Oracle connection"
      (List.map assert_success ["connectivity"; "drop-table" ])
end


module DatabaseSQLite =
struct
  let () =
    register_suite "sqlite" "Test Sqlite connection" [
      assert_success "insert-1000-entries";
      assert_true "drop-table"
        ~expected_failure:true (fun _ -> false) ();
    ]
end

let () = Broken.main ()
