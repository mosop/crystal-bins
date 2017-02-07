# Crystal Binaries and Builder's Scripts

This project contains:

* Cross-compiled Crystal compiler Object (.o) files ([Releases](https://github.com/mosop/crystal-bins/releases))
* Crystal compiler install scripts
* Information about building cross-platform Crystal applications

Experimental.

## Supported Platforms

* Alpine Linux (tested on 3.5)
* Mac OS X (tested on Yosemite)
* Ubuntu (tested on 14.04)

## Build Script

### Commands

#### build install

Just installs the crystal and shard executables under /usr/local/mosop/crystal.

```
$ bin/build install
```

#### build symlink

Installs the executables and creates the symlinks to the crystal and shards executables under /usr/local/bin.

```
$ bin/build symlink
```

#### build crenv

Installs the executables and appends the version into the crenv's versions directory.

```
$ bin/build crenv
```

### Dependencies

You may need to install some tools and libraries for building/running Crystal applications.

#### Linux

See the sample Dockerfiles under the dockerfiles directory.

#### OS X

You need the Xcode command line tools and the following Homebrew packages.

* curl
* llvm
* bdw-gc
* gmp
* libevent
* libyaml
* libxml2
