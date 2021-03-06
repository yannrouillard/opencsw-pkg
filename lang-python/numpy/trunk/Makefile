# Copyright 2009 OpenCSW
# Distributed under the terms of the GNU General Public License v2
# $Id$

NAME = numpy
VERSION = 1.7.1
CATEGORIES = python
GARTYPE = v2

DESCRIPTION = Standard numerical array library for python
define BLURB
  numpy is the standard numerical array library for python, the successor
  to Numeric and numarray. numpy provides fast operations for homogeneous
  data sets and common mathematical operations like correlations, standard
  deviation, fourier transforms, and convolutions.
endef

SPKG_SOURCEURL = http://numpy.scipy.org/
DISTFILES = $(DISTNAME).tar.gz

PATCHFILES += 0001-mvec-is-a-SPARC-only-library.patch

# the so version (and package names) for libsunperf differ depending
# on platform
SUNPERF_SO_sparc = 7
SUNPERF_SO_i386 = 3
SUNPERF_SO = $(SUNPERF_SO_$(GARCH))

RUNTIME_DEP_PKGS_CSWpy-numpy += CSWlibgcc-s1
RUNTIME_DEP_PKGS_CSWpy-numpy += CSWlibpython2-6-1-0
RUNTIME_DEP_PKGS_CSWpy-numpy += CSWlibpython2-7-1-0
RUNTIME_DEP_PKGS_CSWpy-numpy += CSWlibsunperf$(SUNPERF_SO)

LICENSE = LICENSE.txt

EXTRA_CFLAGS_2_6 = -xnorunpath
EXTRA_CFLAGS += $(EXTRA_CFLAGS_$(PYTHON_VERSION))

export ATLAS = None
export BLAS = $(CC_HOME)/lib/libsunperf.so
export LAPACK = $(libdir)/libsunmath.so

TEST_SCRIPTS =
INSTALL_ARGS += --root=$(DESTDIR)

REINPLACE_USRLOCAL += $(SITE_PACKAGES)/numpy/site.cfg.example
REINPLACE_USRLOCAL += $(SITE_PACKAGES)/numpy/distutils/system_info.py
REINPLACE_WHEN_USRLOCAL = postinstall

# because we need to force the use of libsunperf from (initially) the
# studio install dir, the RPATH gets munged, regardless of
# -xnorunpath.  Our library path takes precedence though so we do not relay on things from studio at runtime.
CHECKPKG_OVERRIDES_CSWpy-numpy += bad-rpath-entry

include gar/category.mk
