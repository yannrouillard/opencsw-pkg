# $Id$

NAME = libxcb
VERSION = 1.5
CATEGORIES = x11
GARTYPE = bts

DESCRIPTION = The XCB library
define BLURB
  The XCB library provides an interface to the X Window System protocol,
  designed to replace the Xlib interface
endef

MASTER_SITES = http://xcb.freedesktop.org/dist/
DISTFILES = $(NAME)-$(VERSION).tar.bz2

BUILD_DEP_PKGS = CSWlibxaudevel CSWlibpthreadstubs CSWdoxygen CSWpython CSWxcbproto CSWgraphviz2
RUNTIME_DEP_PKGS_NIMOSSlibxcb = NIMOSSlibxau
PACKAGES = NIMOSSlibxcb NIMOSSlibxcbdevel NIMOSSlibxcbdoc

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

SPKG_DESC_NIMOSSlibxcb      = The XCB library
SPKG_DESC_NIMOSSlibxcbdevel = The XCB library development package
SPKG_DESC_NIMOSSlibxcbdoc   = The XCB library documentation

CATALOGNAME_NIMOSSlibxcb      = libxcb
CATALOGNAME_NIMOSSlibxcbdevel = libxcb_devel
CATALOGNAME_NIMOSSlibxcbdoc   = libxcb_doc

PKGFILES_NIMOSSlibxcbdevel = $(PKGFILES_DEVEL)
PKGFILES_NIMOSSlibxcbdoc   = $(PKGFILES_DOC)

RUNTIME_DEP_PKGS_NIMOSSlibxcbdevel = NIMOSSlibxcb NIMOSSlibpthreadstubs
RUNTIME_DEP_PKGS_NIMOSSlibxcb	     = NIMOSSx11common NIMOSSlibxau NIMOSSlibxdmcp

ARCHALL_NIMOSSlibxcbdoc = 1

BUILD64_LIBS_ONLY = 1
NOISALIST = 1
CONFIGURE_ARGS = $(DIRPATHS)

EXTRA_CFLAGS = -D__solaris__

include gar/category.mk

PATH := $(PATH):/opt/csw/graphviz2/bin

post-install-modulated:
	perl -pi -e 's/^(Cflags:.*)/\1 $(EXTRA_CFLAGS)/' $(DESTDIR)$(libdir)/pkgconfig/xcb.pc
	@$(MAKECOOKIE)

post-merge:
	ginstall -d $(PKGROOT)$(BUILD_PREFIX)/lib
	for lib in composite damage dpms glx record render res screensaver shape shm sync xevie xf86dri xfixes xinerama xprint xtest xv xvmc ; \
	do gln -sf libxcb-$${lib}.so.0.0.0 $(PKGROOT)$(BUILD_PREFIX)/lib/lbxcb-$${lib}.so.0 ; \
	gln -sf libxcb-$${lib}.so.0.0.0 $(PKGROOT)$(BUILD_PREFIX)/lib/lbxcb-$${lib}.so ; \
	done
	gln -sf libxcb-randr.so.1.0.0 $(PKGROOT)$(BUILD_PREFIX)/lib/lbxcb-randr.so.1
	gln -sf libxcb-randr.so.0.0.0 $(PKGROOT)$(BUILD_PREFIX)/lib/lbxcb-randr.so
	gln -sf libxcb.so.1.1.0 $(PKGROOT)$(BUILD_PREFIX)/lib/lbxcb.so.1
	gln -sf libxcb.so.1.1.0 $(PKGROOT)$(BUILD_PREFIX)/lib/lbxcb.so
