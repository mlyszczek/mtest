#!/bin/sh

## ==========================================================================
#   Licensed under BSD 2clause license See LICENSE file for more information
#   Author: Michał Łyszczek <michal.lyszczek@bofc.pl>
#  ==========================================================================
#          __________________________________________________________
#         /                      mtest v1.2.0                        \
#         |                  https://mtest.bofc.pl                   |
#         |                                                          |
#         |    Simple test framework that uses TAP output format     |
#         \                 http://testanything.org                  /
#          ----------------------------------------------------------
#                \
#                 \
#                  \        .
#                   .---.  //
#                  Y|o o|Y//
#                 /_(i=i)K/
#                 ~()~*~()~
#                  (_)-(_)
#
#              Darth Vader Koala
## ==========================================================================
#          __             __                     __   _
#     ____/ /___   _____ / /____ _ _____ ____ _ / /_ (_)____   ____   _____
#    / __  // _ \ / ___// // __ `// ___// __ `// __// // __ \ / __ \ / ___/
#   / /_/ //  __// /__ / // /_/ // /   / /_/ // /_ / // /_/ // / / /(__  )
#   \__,_/ \___/ \___//_/ \__,_//_/    \__,_/ \__//_/ \____//_/ /_//____/
#
## ==========================================================================


mt_test_status=0
mt_total_tests=0
mt_total_failed=0
mt_total_checks=0
mt_checks_failed=0
mt_current_test="none"


## ==========================================================================
#                       __     __ _          ____
#        ____   __  __ / /_   / /(_)_____   / __/__  __ ____   _____ _____
#       / __ \ / / / // __ \ / // // ___/  / /_ / / / // __ \ / ___// ___/
#      / /_/ // /_/ // /_/ // // // /__   / __// /_/ // / / // /__ (__  )
#     / .___/ \__,_//_.___//_//_/ \___/  /_/   \__,_//_/ /_/ \___//____/
#    /_/
## ==========================================================================


## ==========================================================================
#   Runs specified test with optional custom parameters. Check info about
#   mt_run_named() to learn more.
#
#   $1 - function name as a string - will be passed to eval
#   $@ - unspecified number of parameters to pass to function $1
## ==========================================================================


mt_run()
{
	function_name=$1
	shift
	mt_run_named $function_name $function_name $@
}


## ==========================================================================
#   run specified test with custom name to be printed during report and
#   also pass optional arguments to test function.
#
#   $1 - function name as a string - will be passed to eval
#   $2 - test name, will be used instead of $1 in report
#   $@ - unspecified number of parameters to pass to function $1
#
#   Consider:
#
#   foo()
#   {
#       echo param1: $1 param2: $2 param3: $3
#   }
#
#   mt_run_named_param foo test-name 42 "'string with space'" string
#
#   will print
#       param1: 42 param2: string with space param3: string
#
#   NOTE: due to the fact that function is called by `eval', when you
#   want to pass string with space, you need to use double quotation:
#   like this "''".
## ==========================================================================


mt_run_named()
{
	function_name="$1"
	mt_current_test="$2"
	mt_test_status=0
	mt_total_tests=$((mt_total_tests + 1))

	if type mt_prepare_test > /dev/null 2>&1; then
		mt_prepare_test
	fi

	shift
	shift
	eval $function_name $@

	if type mt_cleanup_test > /dev/null 2>&1; then
		mt_cleanup_test
	fi

	if [ $mt_test_status -ne 0 ]; then
		echo "not ok $mt_total_tests - $mt_current_test"
		mt_total_failed=$((mt_total_failed + 1))
	else
		echo "ok $mt_total_tests - $mt_current_test"
	fi
}


## ==========================================================================
#   performs check on given command, if command returns error,  current test
#   will be marked as failed.
#
#   $1 - code to evaluate, simply passed to eval
## ==========================================================================


mt_fail()
{
	mt_total_checks=$(( mt_total_checks + 1 ))
	if ! eval $1; then
		echo "# assert $mt_current_test, '$1'"
		mt_test_status=1
		mt_checks_failed=$(( mt_checks_failed + 1 ))
	fi
}


## ==========================================================================
#   same as mt_fail() but does not use eval and arguments are directly
#   passed to if
#
#   $@ - code to run
## ==========================================================================


mt_dfail()
{
	mt_total_checks=$(( mt_total_checks + 1 ))
	if ! $@; then
		echo "# assert $mt_current_test, '$1'"
		mt_test_status=1
		mt_checks_failed=$(( mt_checks_failed + 1 ))
	fi
}


## ==========================================================================
#   prints test plant in  format 1..<number_of_test_run>.  If all tests have
#   passed,  macro will exit script with code 0,  else  it returns number of
#   failed tests.  If number of failed tests  exceeds 254,  then 254 will be
#   returned.
#
#   This function should be called when all tests have been run
## ==========================================================================


mt_return()
{
	echo "1..$mt_total_tests"

	mt_passed_tests=$((mt_total_tests - mt_total_failed))
	mt_passed_checks=$((mt_total_checks - mt_checks_failed))

	printf "# total tests.......: %4d\n" ${mt_total_tests}
	printf "# passed tests......: %4d\n" ${mt_passed_tests}
	printf "# failed tests......: %4d\n" ${mt_total_failed}
	printf "# total checks......: %4d\n" ${mt_total_checks}
	printf "# passed checks.....: %4d\n" ${mt_passed_checks}
	printf "# failed checks.....: %4d\n" ${mt_checks_failed}

	if [ $mt_total_failed -gt 254 ]; then
		exit 254
	else
		exit $mt_total_failed
	fi
}
