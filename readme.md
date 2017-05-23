About
=====

**mtest** - macro test, is a very small unit test framework. Really small, it
contains only single header file with macros only. **mtest** outputs test
results in TAP (https://testanything.org/) format, so it can be piped to
anything (like automake or jenkins) for even nicer output.

Dependencies
============

Valid C89 compiler with *fprintf* function implemented.

Instalation
===========

Just copy **mtest.h** into your project tree, and include it. It's that easy. You
can also call *make install* so **mtest** is copied into local machine. Just
mind that **mtest** will become your build dependency, and it's so small, it is
usually not necessary. The good thing of calling **make install** is that, man
pages will be installed in your system, so you can have quick overview of the
library if you forget anything.

Why
===

Because KISS. There are many good frameworks out there for testing, but I missed
something really small yet powerfull. This framework does its job well, it is
very easy to integrate with tools like Jenkins for test result presentation and
it's a proof that unit testing can be very easy to implement.

Examples
========

memperf (https://github.com/mlyszczek/memperf) makes use of this framework for
its tests. Tests results are integrated with automake **make check** call.

License
=======

Licensed under BSD 2-clause license. See LICENSE file for more information.

Authors
=======

Michał Łyszczek <michal.lyszczek@bofc.pl>
