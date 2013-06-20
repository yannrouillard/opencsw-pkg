NAME    = scummvm
VERSION = 1.6.0
GARTYPE = v2

DESCRIPTION = Virtual machine for several classic graphical point-and-click adventure games
define BLURB
endef

MASTER_SITES = $(SF_MIRRORS)
DISTFILES  = $(NAME)-$(VERSION).tar.bz2
DISTFILES += README.solaris scummvm.desktop


RUNTIME_DEP_PKGS_CSWscummvm += CSWlibz1
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibogg0
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibvorbis0
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibstdc++6
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibsdl1-2-0
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibflac8
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibgcc-s1
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibvorbisfile3
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibfluidsynth1
RUNTIME_DEP_PKGS_CSWscummvm += CSWmesa
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibfreetype6
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibmad0
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibfaad2
RUNTIME_DEP_PKGS_CSWscummvm += CSWlibtheoradec1

BUILD64 = 1
ISAEXEC = 1

BUILD_DEP_PKGS_CSWscummvm += CSWlibsdl-dev
BUILD_DEP_PKGS_CSWscummvm += CSWfluidsynth-dev
BUILD_DEP_PKGS_CSWscummvm += CSWlibmad-dev
BUILD_DEP_PKGS_CSWscummvm += CSWlibfaad-dev
BUILD_DEP_PKGS_CSWscummvm += CSWlibtheora-dev

PATCHFILES += 0001-redefining-FILE.patch
PATCHFILES += 0002-configure-really-is-a-bash-script.patch

GARCOMPILER = GCC4

# Custom configure
CONFIGURE_ARGS = --prefix=$(prefix)
CONFIGURE_ARGS += --bindir=$(bindir)
CONFIGURE_ARGS += --mandir=$(mandir)
CONFIGURE_ARGS += --datarootdir=$(datadir)
CONFIGURE_ARGS += --libdir=$(libdir)
CONFIGURE_ARGS += --enable-release
CONFIGURE_ARGS += --enable-plugins
CONFIGURE_ARGS += --default-dynamic
CONFIGURE_ARGS += --enable-updates
CONFIGURE_ARGS += --disable-nasm

TEST_TARGET = test

# Testsuite relies on Python which throws lots of errors, disable for now
SKIPTEST ?= 1

include gar/category.mk

# For "install" with GNU syntax
PATH := /opt/csw/gnu:$(PATH)

post-install-modulated:
	ginstall -m 0644 $(FILEDIR)/README.solaris \
		$(DESTDIR)$(datadir)/doc/scummvm/
	ginstall -m 755 -d $(DESTDIR)$(datadir)/applications
	ginstall -m 0644 $(FILEDIR)/scummvm.desktop \
		$(DESTDIR)$(datadir)/applications/
	@$(MAKECOOKIE)

