About
=====

This is example usage of **mtest** framework

Description
===========

  * add-tests
    This file contains various tests presenting how mt_assert and mt_fail works.
    This also presents that tests can be called from main using single
    test_group function

  * sub-tests
    Tests with public interfaces that are used directly from the main function
    without any test group functions

  * calc
    file contains functions that are being tested. Black magic happens here,
    don't be upsed if you don't understand what is going on here.

  * tests
    main function, calls test group for add tests, and call directly tests from
    sub-tests. Also includes single test inside.

Run
===

Just do make && ./example to see output. If you are lazy, no worries, output is
included below

Output
======

~~{.sh}
$ ./example
ok 1 - add_test_valid
# assert [add-tests.c:43] add_test_invalid_single_assert, add(3, 2) == 6
not ok 2 - add_test_invalid_single_assert
# assert [add-tests.c:66] add_test_invalid_multi_assert, add(3, 2) == 6
not ok 3 - add_test_invalid_multi_assert
# assert [add-tests.c:95] add_test_invalid_single_fail, add(3, 2) == 6
not ok 4 - add_test_invalid_single_fail
# assert [add-tests.c:118] add_test_invalid_multi_fail, add(3, 2) == 6
# assert [add-tests.c:125] add_test_invalid_multi_fail, add(3, 5) == 7
not ok 5 - add_test_invalid_multi_fail
ok 6 - sub_test_valid
# assert [sub-tests.c:20] sub_test_invalid, sub(5, 3) == 5
not ok 7 - sub_test_invalid
ok 8 - sub_test
1..8
~~~
