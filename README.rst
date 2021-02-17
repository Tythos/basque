Basque
======

Basque is a basic c-family project structure template.

I got tired of unpredictable cross-platform builds and didn't want to rely on
build tools and scripts in another language (sorry, Scons--I still love you!).
I also wanted a halfway-point / stepping-stone towards better packages and
dependency management for C-family projects. Yeah, it's a pipe dream, but even
if I just use this for myself, it will be a value-added template and I'll be
happy.

.. contents::

Folder Structure
----------------

We borrow heavily from GNU and this excellent Quora post:

  https://www.quora.com/What-is-a-general-C++-project-structure-like?share=1

Most folders you will find recognizable. One important endgoal we're going for
here is to simplify the eventual library-packaging-and-sharing problem, so we
do (for example) keep include headers and source code separate. We also
sepasrate binary executables (.exe) from static libraries (.lib/.a). Where do
dynamic libraries (.dll, .dlib) go? To be determined.

* bin/

  * (x64|x86)/

    * (debug|release)/

      * [project name].exe, etc.

* dat/

  * [static file resources--compressed and archived for release?]

* doc/

  * .html, etc. (e.g., doxygen output or other)

* inc/

  * .h

* lib/

  * (x64|x86)/

    * (debug|release)/

      * .lib, .a

* obj/

  * (x64|x86)/

    * (debug|release)/

      * .obj, .o

* src/

  * .c, .cpp

Most folders have a ".gitignore" at present, primarily to ensure a) binary
contents are not included in version control, and b) the folder IS included
even if it is initially empty.

Top-Level Files
---------------

There's a lot of potential top-level files to expect in a source code project.
Really the only one a package will require will be something like a package
declaration (e.g., package.json), so I hesitate to "require" anything too
specific. But here are some candidates:

* *.gitignore* would likely include build product folders, of course

* *.-ci.yml* (e.g., GitLab or other) for automating CI/CD builds

* *Dockerfile* for organizing a runtime environment

* *package.json* should, at minimum, define a source URL (for a git-clone
  operation, for example); license; and dependency information. We assume
  other package properties, like author and version information, is either
  listed under the source URL (a GitHub project, for example) or within
  verion control metadata (version as tags, etc.).

* *README.rst*, because some minimal documentation (especially for a project
  hosting page, like GitHub) is always a useful thing.

Building
--------

Right now, build steps are automated for MSVC (command line) in "build.bat"; I
do not expect this to be a permenant feature. Rather, it is mainly to automate
generation of build products and verify basic structure/contents. I'm thinking
some separate scripts would be useful here, but jury's out on whether we want
to build directly or use the folder structure to generate an IDE project
definition (.SLN for Visual Studio, etc.) and build from there.

A note on build configurations: Some projects, like Boost, have MANY more build
configuration options than simply architecture (e.g., x86 vs x64) and profile
(e.g., debug vs release). And of course there are occasionally more build
profiles than just "debug" and "release", too. I know, it's not simple.

Note that there are several (three, specifically--obj; lib; and bin) folders
organized around build configurations. I think it's a good idea to manage state
as much as possible--so deleting these folders (or ignoring their contents in
git) should completely "reset" a build to a clean state. Similarly, any usable
products should be stored within a specific build configuration folder (even at
the expense of some redundancy) so a they remain copy-and-paste-ably
self-contained. This also greatly simplifies any external references (from
packages that may depend upon this one, for example).

Makefile? Maybe. It's basically a structured build script, and I'd rather move
away from that towards something that's more consistent and can utilize (for
example) package dependency information. We'll see.

At present, we are focusing primarily on static library sharing. We may expand
definitions and expectations (e.g., folder artifacts and build script examples)
to include dynamic libraries in the near future.
