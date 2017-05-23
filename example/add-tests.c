/* ==========================================================================
    Licensed under BSD 2clause license. See LICENSE file for more information
    Author: Michał Łyszczek <michal.lyszczek@bofc.pl>
   ========================================================================== */

#include "../mtest.h"
#include "add-tests.h"
#include "calc.h"

/*
 * extern declarations of mtest variables, needed for all mt_* functions to work
 * properly
 */

mt_defs_ext();


/* ==========================================================================
    Tests where everything is ok.
   ========================================================================== */


static void add_test_valid(void)
{
    mt_assert(add(5, 3) == 8);
    mt_assert(add(1, 6) == 7);
}


/* ==========================================================================
    Using assert when single one fails
   ========================================================================== */


static void add_test_invalid_single_assert(void)
{
    mt_assert(add(1, 2) == 3);

    /*
     * this assertion will fail and function will return
     */

    mt_assert(add(3, 2) == 6);

    /*
     * so this code won't be even executed
     */

    mt_assert(add(4, 2) == 6);
}


/* ==========================================================================
    Test where 2 asserts fails, but only one is printed to terminal
   ========================================================================== */


static void add_test_invalid_multi_assert(void)
{
    mt_assert(add(1, 2) == 3);

    /*
     * this assertion will fail and function will return
     */

    mt_assert(add(3, 2) == 6);

    /*
     * so this code won't be even executed
     */

    mt_assert(add(4, 2) == 6);

    /*
     * and this assertion fail won't be printed to the terminal
     */

    mt_assert(add(3, 5) == 7);
}


/* ==========================================================================
    Test where single fail assert fails
   ========================================================================== */


static void add_test_invalid_single_fail(void)
{
    mt_fail(add(1, 2) == 3);

    /*
     * this will fail the test, but test will continue
     */

    mt_fail(add(3, 2) == 6);

    /*
     * so this test will be performed
     */

    mt_fail(add(4, 2) == 6);
}


/* ==========================================================================
    Tests where two fail asserts fails, and both are printed to terminal
   ========================================================================== */


static void add_test_invalid_multi_fail(void)
{
    mt_fail(add(1, 2) == 3);

    /*
     * this will fail the test, but test will continue
     */

    mt_fail(add(3, 2) == 6);
    mt_fail(add(4, 2) == 6);

    /*
     * and this will fail to, printing assert information to the terminal
     */

    mt_fail(add(3, 5) == 7);
}


/* ==========================================================================
    Test group that executes all tests for 'add' function
   ========================================================================== */


void add_tests(void)
{
    mt_run(add_test_valid);
    mt_run(add_test_invalid_single_assert);
    mt_run(add_test_invalid_multi_assert);
    mt_run(add_test_invalid_single_fail);
    mt_run(add_test_invalid_multi_fail);
}
