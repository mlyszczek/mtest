/* ==========================================================================
    Licensed under BSD 2clause license. See LICENSE file for more information
    Author: Michał Łyszczek <michal.lyszczek@bofc.pl>
   ========================================================================== */


#include "../mtest.h"


mt_defs_ext();


/* ==========================================================================
    run multiple, single check, quick tests
   ========================================================================== */


void quick_tests(void)
{
	mt_run_quick(1 == 1);
	mt_run_quick(2 != 1);
	mt_run_quick(2 == 1);
	mt_run_quick_named(1 == 1, "1 should be equal to 1");
	mt_run_quick_named(2 == 1, "2 should be equal to 1 (strange platform)");
	mt_run_quick_named(2 != 1, "2 should not be equal to 1");
}
