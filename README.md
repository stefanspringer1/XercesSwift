# XercesSwift

This is a Swift wrapper for Xerces-C++ to use it as SAX parser including validation, in an experimental state.

# Status:

- This wrapper uses Objective-C as intermediate code because the C++ binding to Swift is not ready for production yet.
- The wrapper code is incomplete, as only the start of an element is reported and only with its name, _but it would be easy to make this complete once the other problems are resolved._
- The wrapper code _does_ function in principle, as can be seeen in the project [XercesSwiftXcode](https://github.com/stefanspringer1/XercesSwiftXcode) which is an Xcode project that does run successfully and that includes the xercesc dynamic library (the `libxerces-c-3.2.dylib` inside that project is for macOS on Intel; it might be necessary to replaced it by the one for macOS on ARM from [XercesBuild](https://github.com/stefanspringer1/XercesBuild), see there for more info about the binaries that you can also easily compile yourself).
- **The problem is to make this working as a Swift package,** with the goal to also use it on other platforms than the Apple platforms. There is currently no possibility to include a (in our case platform dependant) dynamic library in such a project (hopefully, in the future there could be such a possibility). So that library has to be "installed" on the target system. This is the part where problems arises (see below): the content of the library is not available, there are according error messages during the build process.
- The content of the files in `Sources/libxerces` might still be incomplete, but this should not be the source for the mentioned problems.

Note that there is another project (MLIRSwift)[https://github.com/circt/MLIRSwift] by someone else where working in that manner with a binary library _does_ function, and, in principle, we are trying here to do the "same" here.

# Installing the library:

This should be doable on a Linux system and easy on Windows (by using regsvr32). On macOS, this is more complicated, it seems you have to make an appropriate package info file and locate it at an appropriate place. The script `Tools/install-pkg-config.sh` tries to accomplish this. See the already mentioned (MLIRSwift)[https://github.com/circt/MLIRSwift] where this actually works.

# The errors

See the example project [XercesSwiftExample](https://github.com/stefanspringer1/XercesSwiftExample), where this package is included, for the error messages that arise when trying to use this package: the library is actually not available.

Of course, any help is welcome!

---

Legal notice: Using any of the included material is at your own risk. The C++ files, except the ones for the binding to Swift, are from [https://xerces.apache.org/xerces-c/](https://xerces.apache.org/xerces-c/) and are used under the Apache 2 license.