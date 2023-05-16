# Git

Git is a content-addressable filesystem.

This means that the core of Git is a simple key-value store.

Simply put, for anything you put into a Git repository, Git will hand you a unique key you can use later to retrieve the content.

## Core

The core parts of Git are within the `.git` file:

- HEAD -> file that points to the branch you currently have checked out
- index -> file where Git stores information about the staging area
- objects -> directory that stores all content for the database
- refs -> directory that stores pointers into commit objects in that data (branches, tags, remotes, and more)

### Objects

Stored in `.git/objects`.

There are three types of objects:

- Blob -> holds the file data (but not metadata). Is identified by the SHA-1 hash of its content.
- Tree -> like a directory, it references a list of blobs and other trees. It represents the filesystem snapshot by holding blobs along with the filename and executable bit.
- Commit -> points to a tree, marking it as what the project looked like at a certain point in time. It contains metadata like author, committer, commit message, and pointers to the commit(s) directly before it.

Essential commands:

- `git hash-object` -> takes some data and stores it in your `.git/objects` directory, and gives back the unique key that refers to that object
- `git cat-file` -> like a swiss army knife for Git objects, allowing you to inspect the contents such as object type.

A tree object is a representation of a directory. It lists the filenames alongside the SHA-1 hash for the blob or the subtree that is associated with the file or subdirectory.

The SHA-1 hash is what is used to uniquely identify each object. This hash is a 40-character checksum of the object's content and some additional information. It is divided into a directory and a filename. The first two characters are the directory, and the remaining 38 characters are the filename.

### References

`refs` are simple names that represent that point to commit SHA-1 values. Makes it easier to refer to specific commits.

- HEAD -> a special type of reference that points to the current branch or commit that is checked out. It is usually a symbolic reference, meaning it points to another reference, not directory to a commit.
- Tags -> references that point to specific commits, typically used to mark important points in history, such as a version release. There is two types:
  - lightweight -> a static reference to a commit
  - annotated -> a more complex tag that includes tagging message, tagger, and date.
- Remote -> references to the state of branches on your remote repositories. They are read-only and are updated when you fetch, pull, or push data to the repository.
