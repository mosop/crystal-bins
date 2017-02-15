# Crystal Binaries and Builder's Scripts

This project contains:

* Cross-compiled Crystal compiler Object (.o) files ([Releases](https://github.com/mosop/crystal-bins/releases))
* Crystal compiler build scripts
* Information about building cross-platform Crystal applications

Experimental.

## Supported Platforms

* Alpine Linux (tested on 3.5)
* Mac OS X (tested on Yosemite)
* Ubuntu (tested on 14.04)

## Build Script Usage

### Commands

#### build install

Just installs the crystal and shard executables under /usr/local/mosop/crystal.

```
$ bin/build install
```

#### build symlink

Installs Crystal and Shard and creates the symlinks to the executables under /usr/local/bin.

```
$ bin/build symlink
```

#### build crenv

Installs the executables and appends the version into the crenv's versions directory.

```
$ bin/build crenv
```

### Dependencies

See Dependencies.md
