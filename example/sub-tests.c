/* ==========================================================================
    Licensed under BSD 2clause license. See LICENSE file for more information
    Author: Michał Łyszczek <michal.lyszczek@bofc.pl>
   ========================================================================== */


#include "../mtest.h"
#include "sub-tests.h"
#include "calc.h"

mt_defs_ext();

void sub_test_valid(void)
{
    mt_assert(sub(5, 3) == 2);
}

void sub_test_invalid(void)
{
    mt_assert(sub(5, 3) == 5);
}
