# $Id$
#
# ! Ada is not built yet, it requires PPL which isn't built yet.
#
# amd64 compilation fails
# potentially related bug:
# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=39048

NAME      = gcc
VERSION   = 3.4.6
CATEGORIES   = lang
GARTYPE = v2
BASE_VERSION = $(shell echo $(VERSION) | gsed -e 's/^\([0-9]\+\.[0-9]\+\)\(.*\)/\1/')
# PKG_BASENAME = CSWgcc-$(subst .,-,$(BASE_VERION))
PKG_BASENAME = CSWgcc3

DESCRIPTION  = The GNU Compiler Collection
define BLURB
	The GNU Compiler Collection includes front ends for C, C++, 
	Objective-C, Fortran, Java, and Ada, as well as libraries 
	for these languages (libstdc++, libgcj,...).
endef

DISTFILES    = $(DISTNAME).tar.bz2
MASTER_SITES = $(GNU_MIRROR)/$(NAME)-$(VERSION)/

PACKAGING_PLATFORMS = solaris9-sparc solaris9-i386
PACKAGING_PLATFORMS += solaris10-sparc solaris10-i386

# GIT init takes a long time, disable for now, reenable if build works
# NOGITPATCH ?= 1

## Source URLs
VENDOR_URL = http://gcc.gnu.org

## Copyright File
LICENSE = COPYING

# prefix = $(BUILD_PREFIX)/gcc4
# libdir_install = $(BUILD_PREFIX)/lib
# libdir = $(abspath $(BUILD_PREFIX)/lib/$(MM_LIBDIR))
# CONFIGURE_ARGS += --prefix=$(prefix)
# CONFIGURE_ARGS += --libdir=$(libdir)
# CONFIGURE_ARGS += --exec-prefix=$(BUILD_PREFIX)/gcc4

## build options
# http://gcc.gnu.org/install/configure.html

# Could be used to break out of the /opt/csw/gcc4 prefix
PROGRAM_SUFFIX = -$(BASE_VERSION)
CONFIGURE_ARGS += --program-suffix=$(PROGRAM_SUFFIX)

CONFIGURE_ARGS += $(DIRPATHS)
CONFIGURE_ARGS += --with-gnu-as
CONFIGURE_ARGS += --with-as=/opt/csw/bin/gas
CONFIGURE_ARGS += --without-gnu-ld
CONFIGURE_ARGS += --with-ld=/usr/ccs/bin/ld
CONFIGURE_ARGS += --enable-nls
CONFIGURE_ARGS += --with-included-gettext
CONFIGURE_ARGS += --with-libiconv-prefix=$(BUILD_PREFIX)
CONFIGURE_ARGS += --with-x
CONFIGURE_ARGS += --with-mpfr=$(BUILD_PREFIX)
CONFIGURE_ARGS += --with-gmp=$(BUILD_PREFIX)
# To be enabled when PPL is built
# CONFIGURE_ARGS += --with-ppl=$(BUILD_PREFIX)
CONFIGURE_ARGS += --enable-java-awt=xlib
# CONFIGURE_ARGS += --enable-libada
CONFIGURE_ARGS += --enable-libssp
# Compilation fails with gc.h not found
# http://gcc.gnu.org/ml/gcc-bugs/2002-02/msg00070.html
# CONFIGURE_ARGS += --enable-objc-gc
CONFIGURE_ARGS += --enable-threads=posix 
CONFIGURE_ARGS += --enable-stage1-languages=c
# We'll build ada later. It requires the PPL library.
# CONFIGURE_ARGS += --enable-languages=ada,c,c++,fortran,java,objc
CONFIGURE_ARGS += --enable-languages=c,c++,f77,java,objc
CONFIGURE_ARGS += --enable-bootstrap
CONFIGURE_ARGS += --with-system-zlib

# there could be some abstractions in gar.conf.mk, but at the moment there
# aren't so let's specify architectures by hand.
#
# This avoids the sparcv8+ binaries.
CPU_sparc_32 = v8
CPU_sparc_64 = v9
CPU_i386_32 = i386
CPU_i386_64 = x86-64

CONFIGURE_ARGS_sparc += --with-cpu=$(CPU_$(GARCH)_32)
# These two should not be defined, otherwise the Intel build breaks.
# CONFIGURE_ARGS_i386 += --with-cpu-32=$(CPU_$(GARCH)_32)
# CONFIGURE_ARGS_i386 += --with-cpu-64=$(CPU_$(GARCH)_64)
CONFIGURE_ARGS += $(CONFIGURE_ARGS_$(GARCH))

# GCC can't be built in the same directory with the sources.
# It also can't be built in a subdirectory of the sources.
OBJDIR          = $(abspath $(WORKDIR)/objdir)

# These flags are passed when gcc is built with gcc.
# Needed to remove FLAVOR_FLAGS, because they were Sun Studio specific.
CFLAGS_FOR_TARGET_sparc = -O2 $(ARCHFLAGS_GCC4_$(ISA)) $(EXTRA_GCC4_CC_FLAGS) $(EXTRA_GCC_CC_FLAGS) $(EXTRA_CC_FLAGS)
CXXFLAGS_FOR_TARGET_sparc = -O2 $(ARCHFLAGS_GCC4_$(ISA)) $(EXTRA_GCC4_CXX_FLAGS) $(EXTRA_GCC_CXX_FLAGS) $(EXTRA_CXX_FLAGS)
CFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET_$(GARCH))
CXXFLAGS_FOR_TARGET = $(CXXFLAGS_FOR_TARGET_$(GARCH))
EXTRA_EXPORTS += CFLAGS_FOR_TARGET
EXTRA_EXPORTS += CXXFLAGS_FOR_TARGET

# The theory goes that the CFLAGS and others cause problems with the multilib
# builds where 64-bit binaries are built.  This is triggered by the gcc build;
# the compiler binaries are 32-bit only, but since the compiler can generate
# 32-bit and 64-bit binaries, the libraries have to be built for both
# architectures.
ifeq ($(MODULATION),isa-i386)
CFLAGS =
CXXFLAGS =
FFLAGS =
FCFLAGS =
OPTFLAGS =
endif

# Might be necessary, but CFLAGS_FOR_TARGET seem to be enough for now.
# BOOT_CFLAGS = $(CFLAGS_FOR_TARGET)
# EXTRA_EXPORTS += BOOT_FLAGS

# bash must be used, otherwise:
# http://fixunix.com/solaris/490396-gcc-build-fails-cannot-compute-suffix-object-files.html
CONFIG_SHELL = /opt/csw/bin/bash
EXTRA_EXPORTS += CONFIG_SHELL

EXTRA_CONFIGURE_EXPORTS += CFLAGS_FOR_TARGET
EXTRA_CONFIGURE_EXPORTS += CXXFLAGS_FOR_TARGET

# Only required for Sun Studio bootstrapping
# PATCHFILES += 0001-clear-AM_CFLAGS-in-lto-plugin.patch
PATCHFILES += 0001-GNU-assembler-version-discovery.patch

# Bootstrapping with Sun Studio has issues
# http://gcc.gnu.org/ml/gcc-help/2011-08/msg00191.html
GARCOMPILER = GNU

# There's a lot of failing checks. Probably a lot of porting work.
SKIPTEST = 1

PACKAGES = $(PKG_BASENAME)core
SPKG_DESC_$(PKG_BASENAME)core = GNU C compiler
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlib-gnu-awt-xlib12
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibffi4
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibgcc-s1
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibgcj-tools12
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibgcj12
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibgij12
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibgmp10
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibgomp1
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibmpc2
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibmpfr4
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibssp0
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibz1
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWpython
RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc += CSWlibmpc2
RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc += CSWlibobjc-gc3
RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc += CSWlibobjc3
RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc += CSWlibz1
RUNTIME_DEP_PKGS_CSWlibgcj-tools12 += CSWlibz1
RUNTIME_DEP_PKGS_CSWlibgcj12 += CSWlibz1
RUNTIME_DEP_PKGS_CSWlibgij12 += CSWlibz1

# Because I can.
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-with-bad-content
CHECKPKG_OVERRIDES_$(PKG_BASENAME)g++ += file-with-bad-content
CHECKPKG_OVERRIDES_$(PKG_BASENAME)java += file-with-bad-content
CHECKPKG_OVERRIDES_CSWlibgcj12 += file-with-bad-content
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += discouraged-path-in-pkgmap|$(libexecdir)/gcc/i386-pc-solaris2.9/$(VERSION)/liblto_plugin.la
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += discouraged-path-in-pkgmap|$(libexecdir)/gcc/sparc-sun-solaris2.9/$(VERSION)/liblto_plugin.la
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += discouraged-path-in-pkgmap|$(libexecdir)/gcc/sparc-sun-solaris2.10/$(VERSION)/liblto_plugin.la
CHECKPKG_OVERRIDES_$(PKG_BASENAME)objc += file-with-bad-content
CHECKPKG_OVERRIDES_$(PKG_BASENAME)gfortran += file-with-bad-content
# Due to complex regular expressions
CHECKPKG_OVERRIDES_$(PKG_BASENAME)java += file-collision|$(includedir)/c++/$(VERSION)/sun/awt/CausedFocusEvent.h|$(PKG_BASENAME)g++|$(PKG_BASENAME)java
CHECKPKG_OVERRIDES_$(PKG_BASENAME)g++ += file-collision|$(includedir)/c++/$(VERSION)/sun/awt/CausedFocusEvent.h|$(PKG_BASENAME)g++|$(PKG_BASENAME)java

# Only man pages, so not a big problem. Alternatives could be used, but it
# requires rebuilding libffi.
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(mandir)/man3/ffi_call.3|$(PKG_BASENAME)core|CSWlibffi-dev
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(mandir)/man3/ffi.3|$(PKG_BASENAME)core|CSWlibffi-dev
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(mandir)/man3/ffi_prep_cif.3|$(PKG_BASENAME)core|CSWlibffi-dev

# The .a files are necessary
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += discouraged-path-in-pkgmap
CHECKPKG_OVERRIDES_$(PKG_BASENAME)objc += discouraged-path-in-pkgmap
CHECKPKG_OVERRIDES_$(PKG_BASENAME)java += discouraged-path-in-pkgmap

CHECKPKG_OVERRIDES_$(PKG_BASENAME)gfortran += discouraged-path-in-pkgmap

# From the 'hopeless errors' department:
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(libdir)/libffi.so|CSWgcc3javart|$(PKG_BASENAME)core
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(libdir)/libgcc_s.so|CSWgcc3core|$(PKG_BASENAME)core
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(libdir)/libgcj.so|CSWgcc3javart|$(PKG_BASENAME)core
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(libdir)/libobjc.so|CSWgcc3objcrt|$(PKG_BASENAME)core
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(libdir)/sparcv9/lib-gnu-awt-xlib.so|CSWgcc3javart|$(PKG_BASENAME)core
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(libdir)/sparcv9/libffi.so|CSWgcc3javart|$(PKG_BASENAME)core
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(libdir)/sparcv9/libgcj.so|CSWgcc3javart|$(PKG_BASENAME)core
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(libdir)/sparcv9/libobjc.so|CSWgcc3objcrt|$(PKG_BASENAME)core
CHECKPKG_OVERRIDES_$(PKG_BASENAME)objc += file-collision|$(libdir)/libobjc.so|CSWgcc3objcrt|$(PKG_BASENAME)objc
CHECKPKG_OVERRIDES_$(PKG_BASENAME)objc += file-collision|$(libdir)/sparcv9/libobjc.so|CSWgcc3objcrt|$(PKG_BASENAME)objc
CHECKPKG_OVERRIDES_$(PKG_BASENAME)core += file-collision|$(libdir)/lib-gnu-awt-xlib.so|CSWgcc3javart|$(PKG_BASENAME)core

# Some static libraries are required to build binaries with gcc, for example
# libgcc.a and libgcc_eh.a. Otherwise: ld: fatal: library -lgcc: not found
MERGE_EXCLUDE_LIBTOOL =
MERGE_EXCLUDE_STATICLIBS =
EXTRA_MERGE_EXCLUDE_FILES = $(libdir)/libiberty\.a

# Catch-all package

PACKAGES += CSWlib-gnu-awt-xlib12
CATALOGNAME_CSWlib-gnu-awt-xlib12 = lib_gnu_awt_xlib12
PKGFILES_CSWlib-gnu-awt-xlib12 += $(call baseisadirs,$(libdir),lib-gnu-awt-xlib\.so\.12(\.\d+)*)
SPKG_DESC_CSWlib-gnu-awt-xlib12 += The GNU Compiler Collection, lib-gnu-awt-xlib.so.12
RUNTIME_DEP_PKGS_$(PKG_BASENAME) += CSWlib-gnu-awt-xlib12
RUNTIME_DEP_PKGS_CSWlib-gnu-awt-xlib12 += CSWlibstdc++6
RUNTIME_DEP_PKGS_CSWlib-gnu-awt-xlib12 += CSWlibgcc-s1

PACKAGES += CSWlibffi4
CATALOGNAME_CSWlibffi4 = libffi4
PKGFILES_CSWlibffi4 += $(call baseisadirs,$(libdir),libffi\.so\.4(\.\d+)*)
SPKG_DESC_CSWlibffi4 += The GNU Compiler Collection, libffi.so.4
RUNTIME_DEP_PKGS_$(PKG_BASENAME) += CSWlibffi4
RUNTIME_DEP_PKGS_CSWlibffi4 += CSWlibgcc-s1

PACKAGES += CSWlibgcc-s1
CATALOGNAME_CSWlibgcc-s1 = libgcc_s1
PKGFILES_CSWlibgcc-s1 += $(call baseisadirs,$(libdir),libgcc_s\.so\.1(\.\d+)*)
SPKG_DESC_CSWlibgcc-s1 += The GNU Compiler Collection, libgcc_s.so.1
RUNTIME_DEP_PKGS_$(PKG_BASENAME) += CSWlibgcc-s1
# For reference, the old CSWgcc3corert:
# http://buildfarm.opencsw.org/pkgdb/srv4/1991387f2cb9f545b2a1b254b50638ef/
OBSOLETED_BY_CSWlibgcc-s1 = CSWgcc3corert

PACKAGES += CSWlibgcj-tools12
CATALOGNAME_CSWlibgcj-tools12 = libgcj_tools12
PKGFILES_CSWlibgcj-tools12 += $(call baseisadirs,$(libdir),libgcj-tools\.so\.12(\.\d+)*)
SPKG_DESC_CSWlibgcj-tools12 += The GNU Compiler Collection, libgcj-tools.so.12
RUNTIME_DEP_PKGS_$(PKG_BASENAME) += CSWlibgcj-tools12
RUNTIME_DEP_PKGS_CSWlibgcj-tools12 += CSWlibgcj12
RUNTIME_DEP_PKGS_CSWlibgcj-tools12 += CSWlibgcc-s1

PACKAGES += CSWlibgcj12
CATALOGNAME_CSWlibgcj12 = libgcj12
PKGFILES_CSWlibgcj12 += $(call baseisadirs,$(libdir),libgcj\.so\.12(\.\d+)*)
SPKG_DESC_CSWlibgcj12 += The GNU Compiler Collection, libgcj.so.12
RUNTIME_DEP_PKGS_CSWlibgcj12 += CSWlibgcc-s1

PACKAGES += CSWlibgfortran3
CATALOGNAME_CSWlibgfortran3 = libgfortran3
PKGFILES_CSWlibgfortran3 += $(call baseisadirs,$(libdir),libgfortran\.so\.3(\.\d+)*)
SPKG_DESC_CSWlibgfortran3 += The GNU Compiler Collection, libgfortran.so.3
RUNTIME_DEP_PKGS_$(PKG_BASENAME) += CSWlibgfortran3
RUNTIME_DEP_PKGS_CSWlibgfortran3 += CSWlibgcc-s1
OBSOLETED_BY_CSWlibgfortran3 = $(PKG_BASENAME)gfortranrt

PACKAGES += CSWlibgij12
CATALOGNAME_CSWlibgij12 = libgij12
PKGFILES_CSWlibgij12 += $(call baseisadirs,$(libdir),libgij\.so\.12(\.\d+)*)
SPKG_DESC_CSWlibgij12 += The GNU Compiler Collection, libgij.so.12

PACKAGES += CSWlibgomp1
CATALOGNAME_CSWlibgomp1 = libgomp1
PKGFILES_CSWlibgomp1 += $(call baseisadirs,$(libdir),libgomp\.so\.1(\.\d+)*)
SPKG_DESC_CSWlibgomp1 += The GNU Compiler Collection, libgomp.so.1
RUNTIME_DEP_PKGS_CSWlibgomp1 += CSWlibgcc-s1
OBSOLETED_BY_CSWlibgomp1 += $(PKG_BASENAME)corert

PACKAGES += CSWlibobjc3
CATALOGNAME_CSWlibobjc3 = libobjc3
PKGFILES_CSWlibobjc3 += $(call baseisadirs,$(libdir),libobjc\.so\.3(\.\d+)*)
SPKG_DESC_CSWlibobjc3 += The GNU Compiler Collection, libobjc.so.3
RUNTIME_DEP_PKGS_CSWlibobjc3 += CSWlibgcc-s1

PACKAGES += CSWlibobjc-gc3
CATALOGNAME_CSWlibobjc-gc3 = libobjc_gc3
PKGFILES_CSWlibobjc-gc3 += $(call baseisadirs,$(libdir),libobjc_gc\.so\.3(\.\d+)*)
SPKG_DESC_CSWlibobjc-gc3 += The GNU Compiler Collection, libobjc_gc.so.3
RUNTIME_DEP_PKGS_CSWlibobjc-gc3 += CSWlibgcc-s1

PACKAGES += CSWlibssp0
CATALOGNAME_CSWlibssp0 = libssp0
PKGFILES_CSWlibssp0 += $(call baseisadirs,$(libdir),libssp\.so\.0(\.\d+)*)
SPKG_DESC_CSWlibssp0 += The GNU Compiler Collection, libssp.so.0
RUNTIME_DEP_PKGS_CSWlibssp0 += CSWlibgcc-s1
OBSOLETED_BY_CSWlibssp0 += $(PKG_BASENAME)corert

PACKAGES += CSWlibstdc++6
CATALOGNAME_CSWlibstdc++6 = libstdc++6
PKGFILES_CSWlibstdc++6 += $(call baseisadirs,$(libdir),libstdc\+\+\.so\.6(\.\d+)*)
SPKG_DESC_CSWlibstdc++6 += The GNU Compiler Collection, libstdc++.so.6
RUNTIME_DEP_PKGS_CSWlibstdc++6 += CSWlibgcc-s1
OBSOLETED_BY_CSWlibstdc++6 = $(PKG_BASENAME)g++rt

# The libquadmath.so.0 library is only build on Intel
PACKAGES_i386 += CSWlibquadmath0
CATALOGNAME_CSWlibquadmath0 = libquadmath0
PKGFILES_CSWlibquadmath0 += $(call baseisadirs,$(libdir),libquadmath\.so\.0(\.\d+)*)
SPKG_DESC_CSWlibquadmath0 += GNU C compiler, libquadmath.so.0
RUNTIME_DEP_PKGS_CSWlibquadmath0 += CSWlibgcc-s1

# Dependencies only on Intel
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core_i386 += CSWlibquadmath0
RUNTIME_DEP_PKGS_CSWlibgfortran3_i386 += CSWlibquadmath0
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += $(RUNTIME_DEP_PKGS_$(PKG_BASENAME)core_$(GARCH))
RUNTIME_DEP_PKGS_CSWlibgfortran3 += $(RUNTIME_DEP_PKGS_CSWlibgfortran3_$(GARCH))

PACKAGES += $(PKG_BASENAME)g++
SPKG_DESC_$(PKG_BASENAME)g++ = GNU C++ Compiler
PKGFILES_$(PKG_BASENAME)g++  = $(bindir)/[cg]\+\+$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)g++ += $(bindir)/\w+-\w+-solaris[\d\.]+-[cg]\+\+$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)g++ += $(libexecdir)/.*cc1plus
PKGFILES_$(PKG_BASENAME)g++ += $(libdir)/.*libstdc.*a
PKGFILES_$(PKG_BASENAME)g++ += $(call baseisadirs,$(libdir),libstdc\+\+\.so)
PKGFILES_$(PKG_BASENAME)g++ += $(mandir)/.*g\+\+.1
# I do not understand this regular expression.
PKGFILES_$(PKG_BASENAME)g++ += $(includedir)/c\+\+/(\d+(?:\.\d+)*)/[a-fA-F,h-iH-I,k-nI-N,p-zP-Z,]+.*
PKGFILES_$(PKG_BASENAME)g++ += $(includedir)/c\+\+/(\d+(?:\.\d+)*)/ostream.*
RUNTIME_DEP_PKGS_$(PKG_BASENAME)g++ += CSWlibgmp10
RUNTIME_DEP_PKGS_$(PKG_BASENAME)g++ += CSWlibmpc2
RUNTIME_DEP_PKGS_$(PKG_BASENAME)g++ += CSWlibmpfr4
RUNTIME_DEP_PKGS_$(PKG_BASENAME)g++ += CSWlibstdc++6
RUNTIME_DEP_PKGS_$(PKG_BASENAME)g++ += CSWlibz1

OBSOLETED_BY_CSWlibgcc-s1 += $(PKG_BASENAME)corert
RUNTIME_DEP_PKGS_CSWlibgij12 += CSWlibgcc-s1
RUNTIME_DEP_PKGS_CSWlibgij12 += CSWlibgcj12

PACKAGES += $(PKG_BASENAME)gfortran
SPKG_DESC_$(PKG_BASENAME)gfortran   = GNU Fortran Compiler
RUNTIME_DEP_PKGS_$(PKG_BASENAME)gfortran += CSWlibmpfr4
RUNTIME_DEP_PKGS_$(PKG_BASENAME)gfortran += CSWlibgmp10
RUNTIME_DEP_PKGS_$(PKG_BASENAME)gfortran += CSWlibgfortran3
RUNTIME_DEP_PKGS_$(PKG_BASENAME)gfortran += CSWlibmpc2
RUNTIME_DEP_PKGS_$(PKG_BASENAME)gfortran += CSWlibz1
PKGFILES_$(PKG_BASENAME)gfortran  = $(bindir)/gfortran$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)gfortran += $(bindir)/\w+-\w+-solaris[\d\.]+-gfortran$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)gfortran += $(libdir)/.*libgfortran.*a
PKGFILES_$(PKG_BASENAME)gfortran += $(libexecdir)/.*f951
PKGFILES_$(PKG_BASENAME)gfortran += $(mandir)/.*gfortran.1
PKGFILES_$(PKG_BASENAME)gfortran += $(infodir)/gfortran.*
PKGFILES_$(PKG_BASENAME)gfortran += $(call baseisadirs,$(libdir),libgfortran\.so)
OBSOLETED_BY_$(PKG_BASENAME)gfortran  = $(PKG_BASENAME)g95
OBSOLETED_BY_$(PKG_BASENAME)gfortran += $(PKG_BASENAME)g95rt

PACKAGES += $(PKG_BASENAME)java
SPKG_DESC_$(PKG_BASENAME)java       = GNU Java Compiler
RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += CSWlibmpfr4
RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += CSWlibgmp10
RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += CSWlibgcc-s1
RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += CSWlibgcj-tools12
RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += CSWlibgcj12
RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += CSWlibgij12
RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += CSWlibmpc2
RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += CSWlibz1

PKGFILES_$(PKG_BASENAME)java  = $(bindir)/.*gcj.*$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*jv-scan$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*jv-convert$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*jcf-dump$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*grmi.*$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*grepjar$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gjnih$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gij$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*fastjar$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gjar.*$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gjavah$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gorbd$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*addr2name.awk$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gappletviewer$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gkeytool$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gserialver$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gtnameserv$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gnative2ascii$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(bindir)/.*gc-analyze$(PROGRAM_SUFFIX)
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/gcj.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/gij.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/jv.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/jcf.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/grmi.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*jar.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*jni.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*java.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/gorbd.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/gapplet.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/gkeytool.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/gserialver.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/gtnameserv.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/gnative2ascii.*
PKGFILES_$(PKG_BASENAME)java += $(mandir)/.*/gc-analyze.*
PKGFILES_$(PKG_BASENAME)java += $(datadir)/java/.*
PKGFILES_$(PKG_BASENAME)java += $(libdir)/.*libgij.*a
PKGFILES_$(PKG_BASENAME)java += $(libdir)/.*libffi.*a
PKGFILES_$(PKG_BASENAME)java += $(libdir)/.*lib-gnu-awt.*a
PKGFILES_$(PKG_BASENAME)java += $(libdir)/.*security.*
PKGFILES_$(PKG_BASENAME)java += $(libdir)/.*logging.properties
PKGFILES_$(PKG_BASENAME)java += $(libdir)/.*pkgconfig.*
PKGFILES_$(PKG_BASENAME)java += $(libdir)/.*gcj.*a
PKGFILES_$(PKG_BASENAME)java += $(libdir)/.*libgcj.*a
PKGFILES_$(PKG_BASENAME)java += $(libexecdir)/.*collect.*
PKGFILES_$(PKG_BASENAME)java += $(libexecdir)/.*jvgenmain
PKGFILES_$(PKG_BASENAME)java += $(libexecdir)/.*jc1.*
PKGFILES_$(PKG_BASENAME)java += $(infodir)/gcj.*
PKGFILES_$(PKG_BASENAME)java += $(includedir)/.*gcj/.*
PKGFILES_$(PKG_BASENAME)java += $(includedir)/.*awt/.*
PKGFILES_$(PKG_BASENAME)java += $(includedir)/.*classpath/.*
PKGFILES_$(PKG_BASENAME)java += $(includedir)/.*java.*
PKGFILES_$(PKG_BASENAME)java += $(includedir)/.*ffi.h
PKGFILES_$(PKG_BASENAME)java += $(includedir)/.*org/.*

PACKAGES += $(PKG_BASENAME)objc
SPKG_DESC_$(PKG_BASENAME)objc       = GNU Objective C Compiler
PKGFILES_$(PKG_BASENAME)objc  = $(libexecdir)/.*cc1obj
PKGFILES_$(PKG_BASENAME)objc += $(libdir)/.*libobjc.*a
PKGFILES_$(PKG_BASENAME)objc += $(includedir)/.*objc/.*
PKGFILES_$(PKG_BASENAME)objc += $(libdir)/.*/include/objc/.*
PKGFILES_$(PKG_BASENAME)objc += $(call baseisadirs,$(libdir),libobjc.so)
PKGFILES_$(PKG_BASENAME)objc += $(call baseisadirs,$(libdir),libobjc_gc.so)
RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc += CSWlibmpfr4
RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc += CSWlibgmp10

# libiconv deps cropped up relatively late in the porting process. Perhaps
# they apply to all arch/OS combinations.
RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += CSWlibiconv2
RUNTIME_DEP_PKGS_$(PKG_BASENAME)g++ += CSWlibiconv2
RUNTIME_DEP_PKGS_$(PKG_BASENAME)gfortran += CSWlibiconv2
RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += CSWlibiconv2
RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc += CSWlibiconv2

# Maybe it's unnecessary.
# # Solaris 10 on i386 specific:
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)core_i386_5.10 += CSWlibiconv2
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)g++_i386_5.10 += CSWlibiconv2
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)gfortran_i386_5.10 += CSWlibiconv2
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc_i386_5.10 += CSWlibiconv2
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)java_i386_5.10 += CSWlibiconv2
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)core += $(RUNTIME_DEP_PKGS_$(PKG_BASENAME)core_$(GARCH)_$(GAROSREL))
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)g++ += $(RUNTIME_DEP_PKGS_$(PKG_BASENAME)g++_$(GARCH)_$(GAROSREL))
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)gfortran += $(RUNTIME_DEP_PKGS_$(PKG_BASENAME)gfortran_$(GARCH)_$(GAROSREL))
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc += $(RUNTIME_DEP_PKGS_$(PKG_BASENAME)objc_$(GARCH)_$(GAROSREL))
# RUNTIME_DEP_PKGS_$(PKG_BASENAME)java += $(RUNTIME_DEP_PKGS_$(PKG_BASENAME)java_$(GARCH)_$(GAROSREL))

PACKAGES += $(PACKAGES_$(GARCH))

include files/scripts.mk
include gar/category.mk

# We need GNU find as find
PATH := /opt/csw/gnu:$(PATH)
