#include "../mtest.h"

#include "add-tests.h"
#include "sub-tests.h"

#include "calc.h"

/*
 * define global variables needed for whole mtest framework
 */

mt_defs();


static void sub_test(void)
{
    mt_assert(sub(5, 4) == 1);
}


int main(void)
{
    /*
     * we can execute test group from another file
     */

    add_tests();

    /*
     * or we can call tests directly from another file
     */

    mt_run(sub_test_valid);
    mt_run(sub_test_invalid);

    /*
     * we can also run tests from this very file
     */

    mt_run(sub_test);

    /*
     * and at the end we call mt_return, which will print clousure information
     * and will exit test program with apropriate return code
     */

    mt_return();
}
