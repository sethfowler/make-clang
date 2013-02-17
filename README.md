make-clang
==========

This branch holds the rewrite of `make-clang` which will eventually add the
following features:

- Information stored in an SQLite database.
- Indexing of files with libclang as they are built, recording declarations,
  definitions, and references. This will "go to definition", "find calls to a
  function/method", "find references to a class", "find subclasses of a class",
  "find references to an object", and other nice IDE-style features.

Once this data is available, the ultimate goal is to integrate these features
into YouCompleteMe for vim. (And maybe see if I can find an emacs user with
interest in building something for emacs to make use of this.)
