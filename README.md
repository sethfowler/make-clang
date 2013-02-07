make-clang
==========

A Python script that makes it easy to create clang compilation databases from
Make-based projects.

Still much to do. The current implementation relies on the atomicity of small
calls to write() to function in a parallel building context, which could
certainly be improved. More urgently, it requires too much hand-holding to
operate. Using it should be as simple as calling `make-clang` instead of `make.
Will fix this up over the next week or so as time permits.
