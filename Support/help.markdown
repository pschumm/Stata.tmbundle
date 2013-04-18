Introduction
============

Stata is a software package for data management, data analysis (including
graphics) and statistical computing.

More information about Stata can be found at [stata.com](http://www.stata.com/).


Interaction With Stata
======================

Like Stata's own do-file editor, the Stata bundle permits the user to execute
the current do-file or the selected line(s) within it. The Stata bundle also
permits the user to execute the current line (if no selection is highlighted).
The Stata bundle does *not* permit the user to `run` (i.e., execute quietly) a
file/selection/line (Stata's currently limited support for Apple events
precludes this). In addition, the Stata bundle provides commands to switch
focus to Stata (launching it first if it is not already running) and to show
(in Stata's Viewer) Stata's documentation for the current word/selection.

When using "Do File" or "Do Line/Selection", TextMate's focus will be
retained, just as with Stata's own do-file editor.

How the working directory is set
--------------------------------

When communicating with Stata, the bundle tries to set the working directory
in a sensible way:

1. When using "Switch to Stata", Stata's working directory will be set to the
value of `TM_PROJECT_DIRECTORY` or, if that is not defined, to the location of
the current document. If the command is executed without an open project or
file, then Stata's working directory will be set just as it is when you launch
it by double-clicking on it.

2. When using "Do File", Stata's working directory will be set to the location
of that file (i.e., it is just as if you executed the do-file by
double-clicking on it). If however the preference "Execute do-files from
project directory" is checked, then Stata's working directory will be set to
the value of `TM_PROJECT_DIRECTORY`.

3. When using "Do Line/Selection" or "Documentation for Word/Selection", the
working directory will be set as in (1) except in the case where the command
is executed without an open project or without being in a saved file. In that
case, Stata's working directory will be set to the user's Desktop.

Use of temporary files
----------------------

Because Stata's support for Apple events is limited, communication with Stata
is accomplished through the use of temporary files named `.tm-stata-pid.do`
where `pid` stands for the process ID. These files are written in the working
directory, and deleted automatically afterward. Although this strategy
generally works well, it may fail in cases where Stata is not already running.
Specifically, if it takes too long to launch Stata, the temporary file will be
deleted before Stata can open it. In these cases, you may get an error like

    file .tm-stata-pid.do not found

or Stata will simply fail to issue the `do` command at all (i.e., Stata will
simply launch, just as if you had launched it by double-clicking on it). Note
that if this happens following use of the "Switch to Stata" command, although
Stata will come to the front the working directory may not be set as you
expect (since the bundle relies on opening the temporary file to set the
working directory appropriately). In these cases, once Stata is running simply
execute the bundle command again.


A Tour of the Bundle's Language Features
========================================

To be written.

Snippets for Stata Commands
---------------------------

Snippets are generally used to avoid having to type the same thing repeatedly,
thereby increasing coding efficiency. However, they may also be used to
provide a type of command-line menu interface for Stata commands. This is
especially useful for commands that you may use infrequently or for which the
options are unique to that command (and therefore difficult to remember or
guess). You may tab through the various options, using control+delete to omit
an option entirely.

Tab triggers for Stata commands correspond to the minimal abbreviation
accepted by Stata for that command.


Bug Reports
===========

The bundle code is stored in a [GitHub repository](https://github.com/statatmbundle/Stata.tmbundle).
Bug reports or enhancement requests should be made using the corresponding
GitHub [issue tracker](https://github.com/statatmbundle/Stata.tmbundle/issues).


Maintainers
===========

The Stata bundle is currently maintained by Tom Palmer and Phil Schumm. The
full list of contributors is listed in the AUTHORS file available in the code
repository.
