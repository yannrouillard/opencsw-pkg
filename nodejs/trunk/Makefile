# $Id$
# TODO (release-critical prefixed with !, non release-critical with *)
#
NAME = nodejs
VERSION = 0.10.21
GARTYPE = v2

DESCRIPTION = Node.js JavaScript interpreter
define BLURB
endef

MASTER_SITES = http://nodejs.org/dist/v$(VERSION)/
DISTNAME = node-v$(VERSION)
DISTFILES += $(DISTNAME).tar.gz

LICENSE = LICENSE

PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386
GARCOMPILER = GNU

CONFIGURE_ARGS  = --prefix=$(prefix)
CONFIGURE_ARGS += --openssl-includes=$(includedir)
CONFIGURE_ARGS += --openssl-libpath=$(libdir)

EXTRA_CONFIGURE_EXPORTS += PWD
CONFIGURE_ENV_PWD = $(abspath $(WORKSRC))

RUNTIME_DEP_PKGS_CSWnodejs += CSWlibssl1-0-0
RUNTIME_DEP_PKGS_CSWnodejs += CSWlibgcc-s1
RUNTIME_DEP_PKGS_CSWnodejs += CSWlibstdc++6
RUNTIME_DEP_PKGS_CSWnodejs += CSWlibz1

CHECKPKG_OVERRIDES_CSWnodejs += missing-dependency|CSWpython
CHECKPKG_OVERRIDES_CSWnodejs += file-with-bad-content

TEST_SCRIPTS =

include gar/category.mk

PATH := /opt/csw/gnu:$(PATH)

configure-custom:
	cd $(WORKSRC) && /usr/bin/env -i $(CONFIGURE_ENV) PWD=$(abspath $(WORKSRC)) ./configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)
