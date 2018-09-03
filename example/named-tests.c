/* ==========================================================================
    Licensed under BSD 2clause license. See LICENSE file for more information
    Author: Michał Łyszczek <michal.lyszczek@bofc.pl>
   ========================================================================== */


#include "../mtest.h"
#include "sub-tests.h"
#include "calc.h"


mt_defs_ext();
static int a, b;


/* ==========================================================================
    test to run, mt_run_named takes functions without parameters, so we have
    to use global variables as parameters
   ========================================================================== */


static void add_test(void)
{
    mt_fail(add(a, b) == a + b);
}


/* ==========================================================================
    run single test with different parameters in a loop
   ========================================================================== */


void named_test_in_loop(void)
{
    for (a = 0; a != 3; ++a)
    {
        for (b = 0; b != 3; ++b)
        {
            char test_name[32];

            /*
             * mt_run_named takes "const char *" as parameter,
             * so we have to construct name by ourselfs
             */

            sprintf(test_name, "test add(%d, %d)", a, b);
            mt_run_named(add_test, test_name);
        }
    }
}
