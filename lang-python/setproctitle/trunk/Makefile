# Copyright 2009 OpenCSW
# Distributed under the terms of the GNU General Public License v2
# $Id$

NAME = setproctitle
VERSION = 1.1.8
CATEGORIES = python
GARTYPE = v2

DESCRIPTION = A library to allow customization of the process title

MASTER_SITES = $(PYPI_MIRROR)
DISTFILES = $(DISTNAME).tar.gz

VENDOR_URL = http://code.google.com/p/py-setproctitle/

PACKAGES += CSWpy-setproctitle
SPKG_DESC_CSWpy-setproctitle = A library to allow customization of the process title
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWpy-setproctitle += CSWlibpython2-6-1-0
RUNTIME_DEP_PKGS_CSWpy-setproctitle += CSWlibpython2-7-1-0
RUNTIME_DEP_PKGS_CSWpy-setproctitle += CSWlibgcc-s1
# This is just a shared library with the foreign function stuff
CHECKPKG_OVERRIDES_CSWpy-setproctitle += python-package-missing-py-files

# There is no testsuite
TEST_SCRIPTS =

include gar/category.mk
