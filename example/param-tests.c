/* ==========================================================================
    Licensed under BSD 2clause license. See LICENSE file for more information
    Author: Michał Łyszczek <michal.lyszczek@bofc.pl>
   ========================================================================== */


#include "../mtest.h"
#include "sub-tests.h"
#include "calc.h"


mt_defs_ext();

struct test_param
{
    int a;
    int b;
};

/* ==========================================================================
    test to run, mt_run_named takes functions without parameters, so we have
    to use global variables as parameters
   ========================================================================== */


static void add_test(const struct test_param *p)
{
    mt_fail(add(p->a, p->b) == p->a + p->b);
}


/* ==========================================================================
    Run multiple tests every time with different argument
   ========================================================================== */


void param_test_in_loop(void)
{
    struct test_param p;

    for (p.a = 0; p.a != 3; ++p.a)
    {
        for (p.b = 0; p.b != 3; ++p.b)
        {
            mt_run_param(add_test, &p);
        }
    }
}

/* ==========================================================================
    Run multiple tests every time with different argument, also print
    arguments of the run test.

    This is even better than alone param as it allows to see parameters that
    caused test to fail
   ========================================================================== */


void named_param_test_in_loop(void)
{
    struct test_param p;

    for (p.a = 0; p.a != 3; ++p.a)
    {
        for (p.b = 0; p.b != 3; ++p.b)
        {
            char test_name[32];

            /*
             * mt_run_named takes "const char *" as parameter,
             * so we have to construct name by ourselfs
             */

            sprintf(test_name, "named param test add(%d, %d)", p.a, p.b);
            mt_run_named_param(add_test, &p, test_name);
        }
    }
}
