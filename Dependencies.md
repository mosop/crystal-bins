# Crystal Binaries and Builder's Scripts

## Dependencies

To install and run the Crystal compiler with my build script, you need to setup the dependencies first.

The dependencies are different between build-time and runtime.

You don't have to retain the build-time dependencies in runtime. You can remove them after the build script ends.

### BDWGC

BDWGC (Boehm-Demers-Weiser Garbage Collector) is one of the essential libraries for Crystal applications.

#### Linux

There is no popular package on the supported Linux distributions. So, my script builds and installs BDWGC by itself.

My build script does nothing to expose the installed BDWGC into your library path, such as /usr/lib and /usr/local/lib. Instead, the Crystal runner script, that is installed by the build script, sets the LD_LIBRARY_PATH and LIBRARY_PATH environment variables for making the Crystal compiler correctly link to the installed BDWGC shared library.

If you want to move your application binary built by the Crystal compiler to another machine, make sure that the binary correctly links to BDWGC on the machine. Otherwise, your application fails on startup.

I recommend linking your application statically to BDWGC with the --link-flags option. Because you don't have to install BDWGC into the target machine.

The BDWGC location that is installed by my build script is `/usr/local/mosop/bdwgc/[version]/lib`. To statically link, specify --link-flags like:

```
--link-flags /usr/local/mosop/bdwgc/[version]/lib/libgc.a
```

Note: On OS X, my script does nothing to configure BDWGC. So you have to conditionally set the option for cross-platform building.

Currently, my script installs the version 7_6_0 of BDWGC.

#### OS X

There is a Homebrew package for BDWGC. I recommend installing the package. My script does nothing to configure BDWGC on OS X.

### Build-time Packages (WIP)

| | Alpine apk | Ubuntu apt | OS X homebrew |
| :-- | :-- | :-- | :-- |
| autoconf | autoconf | autoconf | *n/a* |
| automake | automake | automake | *n/a* |
| curl | curl | curl | curl |
| gcc | gcc | gcc | *n/a* (\*1) |
| g++ | g++ | g++ | *n/a* (\*1) |
| libtool | libtool | libtool | *n/a* |
| LLVM 3.8 | llvm-dev | *n/a* | *n/a* |
| LLVM 3.9 | *n/a* | llvm-3.9-dev (\*2) | llvm |
| make | make | make | *n/a* |
| pkg-config | pkgconfig | pkg-config | *n/a* |

\*1 included in the Xcode command line tools<br>
\*2 see http://apt.llvm.org/

### Runtime Packages (WIP)

| | Alpine apk | Ubuntu apt | OS X homebrew |
| :-- | :-- | :-- | :-- |
| libevent | libevent-dev |
| libgc (BDWGC) | *n/a* | *n/a* | bdw-gc
| libmp | gmp-dev |
| libpcre | pcre-dev |
| libreadline | libreadline-dev |
| libssl | openssl-dev |
| libxml2 | libxml2-dev |
| libyaml | yaml-dev |
| libz | zlib-dev |

Note: The runtime packages are also needed in build-time.
