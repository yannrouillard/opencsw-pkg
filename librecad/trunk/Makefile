# $Id$
# TODO (release-critical prefixed with !, non release-critical with *)
#
NAME = LibreCAD
VERSION = 2.0.0rc2
GIT_VERSION = $(VERSION)
GARTYPE = v2
CATEGORIES = gnome

DESCRIPTION = LibreCAD - based on QCAD 2.0
define BLURB
  LibreCAD is a free Open Source CAD application for Windows, Apple and Linux. Support and documentation is free from our large, dedicated community of users, contributors and developers
endef

LICENSE += LICENSE
EXTRA_LICENSE += gpl-2.0.txt
EXTRA_LICENSE += gpl-2.0greater.txt
EXTRA_LICENSE += LICENSE_Apache2.txt
EXTRA_LICENSE += LICENSE_GPLv3.txt

# git clone https://github.com/LibreCAD/LibreCAD.git
# https://github.com/LibreCAD/LibreCAD/tarball/master
MASTER_SITES = 
# DISTFILES  = $(DISTNAME).tar.gz
GIT_REPOS = http://github.com/$(NAME)/$(NAME).git
GIT_USE_PROXY = 1
GIT_TREEISH_LibreCAD.git = $(GIT_VERSION)

GARCOMPILER = GNU
# prefix = $(BUILD_PREFIX)/gxx
PACKAGING_PLATFORMS = solaris10-i386 solaris10-sparc

# PATCHFILES += 0000-adjust-for-csw-environment.patch
PATCHFILES += 0000-add-csw-settings.patch
PATCHFILES += 0001-adjust-rs_system-forcsw.patch
PATCHFILES += 0002-set-version-from-git.patch
PATCHFILES += 0003-fix-postprocessing.patch

BUILD_DEP_PKGS += CSWqt4-dev
BUILD_DEP_PKGS += CSWmuparser-dev
BUILD_DEP_PKGS += CSWboost-gcc-dev
BUILD_DEP_PKGS += CSWlibfreetype-dev

PACKAGES = CSWlibrecad
CATALOGNAME_CSWlibrecad = librecad
SPKG_DESC_CSWlibrecad = $(DESCRIPTION) 
PKGFILES_CSWlibrecad += $(call baseisadirs,$(bindir),.*)
PKGFILES_CSWlibrecad += $(datadir)/$(call tolower,$(NAME))/.*
PKGFILES_CSWlibrecad += $(libdir)/$(call tolower,$(NAME))/.*
RUNTIME_DEP_PKGS_CSWlibrecad += CSWlibqthelp4
RUNTIME_DEP_PKGS_CSWlibrecad += CSWlibqtcore4
RUNTIME_DEP_PKGS_CSWlibrecad += CSWlibstdc++6
RUNTIME_DEP_PKGS_CSWlibrecad += CSWlibqtgui4
RUNTIME_DEP_PKGS_CSWlibrecad += CSWlibqtsvg4
RUNTIME_DEP_PKGS_CSWlibrecad += CSWlibgcc-s1
RUNTIME_DEP_PKGS_CSWlibrecad += CSWlibfreetype6
RUNTIME_DEP_PKGS_CSWlibrecad += CSWlibmuparser2
# RUNTIME_DEP_PKGS_CSWlibrecad += CSWlibqtsql4
# CHECKPKG_OVERRIDES_CSWlibrecad += file-with-bad-content|/usr/share|root/opt/csw/bin/librecad
OBSOLETED_BY_CSWlibrecad = CSWLibreCAD
CHECKPKG_OVERRIDES_CSWLibreCAD += catalogname-not-lowercase

CONFIGURE_ARGS = $(DIRPATHS)

CONFIGURE_SCRIPTS = custom
INSTALL_SCRIPTS = custom

configure-custom: 
	cd $(WORKSRC) && $(bindir)/qmake $(call tolower,$(NAME)).pro
	@$(MAKECOOKIE)

install-custom:
	ginstall -d $(DESTDIR)$(bindir)
	ginstall -m 755   $(WORKSRC)/unix/librecad $(DESTDIR)$(bindir)
	ginstall -m 755   $(WORKSRC)/unix/ttf2lff $(DESTDIR)$(bindir)
	ginstall -d $(DESTDIR)$(libdir)/$(call tolower, $(NAME))/resources
	gcp -rf  $(WORKSRC)/unix/resources/* \
                  $(DESTDIR)$(libdir)/$(call tolower, $(NAME))/resources
	ginstall -d $(DESTDIR)$(docdir)/$(CATALOGNAME_CSWlibrecad)
	$(foreach L,$(EXTRA_LICENSE),gcp $(WORKSRC)/$L $(DESTDIR)$(docdir)/$(CATALOGNAME_CSWlibrecad);)
	@$(MAKECOOKIE)

include gar/category.mk

PATH := /opt/csw/gnu:$(PATH):/opt/csw/gcc4/bin
