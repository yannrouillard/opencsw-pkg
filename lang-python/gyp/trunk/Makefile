# Copyright 2009 OpenCSW
# Distributed under the terms of the GNU General Public License v2
# $Id$

NAME = gyp
VERSION = 0.1
CATEGORIES = python
GARTYPE = v2

define BLURB
  Twisted is a networking engine written in Python, supporting numerous
  protocols. It contains a web server, numerous chat clients, chat servers,
  mail servers, and more.
endef

MASTER_SITES += manual://
DISTFILES += $(DISTNAME).tar.gz

LICENSE = LICENSE

PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

PACKAGES += CSWgyp
SPKG_DESC_CSWgyp = Generate Your Projects
# PKGFILES is catchall

# The projects name is 'gyp'
CHECKPKG_OVERRIDES_CSWgyp += pkgname-does-not-start-with-CSWpy-
CHECKPKG_OVERRIDES_CSWgyp += catalogname-does-not-start-with-py_

# These are default pathes
CHECKPKG_OVERRIDES_CSWgyp += file-with-bad-content|/usr/local|root/opt/csw/lib/python2.7/site-packages/gyp/generator/eclipse.py
CHECKPKG_OVERRIDES_CSWgyp += file-with-bad-content|/usr/local|root/opt/csw/lib/python2.7/site-packages/gyp/generator/xcode.py
CHECKPKG_OVERRIDES_CSWgyp += file-with-bad-content|/usr/local|root/opt/csw/lib/python2.7/site-packages/gyp/xcode_emulation.py

# The software uses 2.7 syntax, so do not include 2.6 here
MODULATIONS_PYTHON_VERSION = 2_7

include gar/category.mk
