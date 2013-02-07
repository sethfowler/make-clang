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

Still much to do. The current implementation relies on the atomicity of small
calls to write() to function in a parallel building context, which could
certainly be improved. More urgently, it requires too much hand-holding to
operate. Using it should be as simple as calling `make-clang` instead of `make`.
Will fix this up over the next week or so as time permits.

If you're interested in trying `make-clang` at this stage, this should give you
an idea for how to use it:

    make CC="make-clang `pwd`/cdb.log /usr/bin/clang" CXX="make-clang `pwd`/cdb.log /usr/bin/clang++"
    make-clang --merge cdb.log compile_commands.json
    rm cdb.log

The `cdb.log` file is temporary and contains a log of the compilation commands
executed during the last build. Once you merge it into the main database using
`make-clang --merge`, you can delete it (as illustrated above). The merge will
replace any existing entries in the database with their corresponding entries in
the log, so that as you perform partial builds the database is kept up to date.
Given that we only care about compiler parameters, it's unlikely that the
database will see many updates for existing files without a full rebuild.
However, merging also allows new files to be seamlessly integrated into the
database without throwing it out and starting from scratch, which is much more
useful.
