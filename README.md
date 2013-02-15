make-clang
==========

A Python script that makes it easy to create [clang compilation
databases](http://clang.llvm.org/docs/JSONCompilationDatabase.html) from
Make-based projects. It was inspired by the
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe) code completion
plugin for vim, which is fantastic but requires a compilation database to
function correctly on the projects I spend most of my time working on.
Unfortunately I couldn't find a tool that worked to generate the database for a
Makefile-based project on OS X, so I wrote my own. (For Linux, there's
[Bear](https://github.com/rizsotto/Bear), which I attempted to port to OS X but
couldn't make work reliably in the time I had available.)

If you're interested in trying `make-clang` at this stage, just put it in your
path and then use `make-clang` wherever you'd use `make`. That's it. It'll place
`compile-commands.json` in the current working directory, and automatically
update it when you do partial builds, so things should just work from that point
forward. Every once in a while it might be good to delete
`compile-commands.json` and recreate it, because `make-clang` won't remove
entries for files that don't exist anymore; that's about all the maintenance you
should ever have to do.
