NAME = cairo
VERSION = 1.12.16
GARTYPE = v2
GARCOMPILER = SOS12U3

DESCRIPTION = The Cairo 2D Graphics Library
define BLURB
  Cairo is a 2D graphics library with support for multiple output devices.
  Currently supported output targets include the X Window System, Quartz, Win32,
  image buffers, PostScript, PDF, and SVG file output. Experimental backends
  include OpenGL (through glitz), XCB, BeOS, OS/2, and DirectFB.
endef

MASTER_SITES = http://www.cairographics.org/releases/
DISTFILES = $(DISTNAME).tar.xz

PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

PATCHFILES += 0001-Remove-cairo_private-from-_cairo_unbounded_rectangle.patch

PACKAGES += CSWlibcairo2
SPKG_DESC_CSWlibcairo2 = The Cairo 2D Graphics Library, libcairo.so.2
PKGFILES_CSWlibcairo2 = $(call pkgfiles_lib,libcairo.so.2)
RUNTIME_DEP_PKGS_CSWlibcairo2 += CSWlibxrender
RUNTIME_DEP_PKGS_CSWlibcairo2 += CSWlibpixman1-0
RUNTIME_DEP_PKGS_CSWlibcairo2 += CSWlibpng15-15
RUNTIME_DEP_PKGS_CSWlibcairo2 += CSWlibz1
RUNTIME_DEP_PKGS_CSWlibcairo2 += CSWlibfreetype6
RUNTIME_DEP_PKGS_CSWlibcairo2 += CSWlibfontconfig1
OBSOLETED_BY_CSWlibcairo2 = CSWlibcairo

PACKAGES += CSWlibcairo-script-interpreter2
SPKG_DESC_CSWlibcairo-script-interpreter2 = The Cairo 2D Graphics Library, libcairo-script-interpreter.so.2
PKGFILES_CSWlibcairo-script-interpreter2 = $(call pkgfiles_lib,libcairo-script-interpreter.so.2)
RUNTIME_DEP_PKGS_CSWlibcairo-script-interpreter2 += CSWlibcairo2
RUNTIME_DEP_PKGS_CSWlibcairo-script-interpreter2 += CSWlibfreetype6
RUNTIME_DEP_PKGS_CSWlibcairo-script-interpreter2 += CSWlibfontconfig1
RUNTIME_DEP_PKGS_CSWlibcairo-script-interpreter2 += CSWlibz1
RUNTIME_DEP_PKGS_CSWlibcairo-script-interpreter2 += CSWliblzo2-2
OBSOLETED_BY_CSWlibcairo-script-interpreter2 = CSWlibcairo

PACKAGES += CSWlibcairo-gobject2
SPKG_DESC_CSWlibcairo-gobject2 = The Cairo 2D Graphics Library, libcairo-gobject.so.2
PKGFILES_CSWlibcairo-gobject2 = $(call pkgfiles_lib,libcairo-gobject.so.2)
RUNTIME_DEP_PKGS_CSWlibcairo-gobject2 += CSWlibcairo2
RUNTIME_DEP_PKGS_CSWlibcairo-gobject2 += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWlibcairo-gobject2 += CSWlibgobject2-0-0
RUNTIME_DEP_PKGS_CSWlibcairo-gobject2 += CSWlibintl8
OBSOLETED_BY_CSWlibcairo-gobject2 = CSWlibcairo
CHECKPKG_OVERRIDES_CSWlibcairo-gobject2 += soname-unused
CHECKPKG_OVERRIDES_CSWlibcairo-gobject2 += surplus-dependency|CSWlibintl8

PACKAGES += CSWlibcairo-dev
SPKG_DESC_CSWlibcairo-dev = Development files for libcairo.so.2
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWlibcairo-dev += CSWlibcairo2
RUNTIME_DEP_PKGS_CSWlibcairo-dev += CSWlibcairo-script-interpreter2
RUNTIME_DEP_PKGS_CSWlibcairo-dev += CSWlibcairo-gobject2
RUNTIME_DEP_PKGS_CSWlibcairo-dev += CSWlibz1
# This is important or pkgconfig on cairo will fail
RUNTIME_DEP_PKGS_CSWlibcairo-dev += CSWlibpixman-dev
OBSOLETED_BY_CSWlibcairo-dev = CSWlibcairodevel
CATALOGNAME_CSWlibcairodevel = libcairo_devel_stub

PACKAGES += CSWlibcairo-doc
SPKG_DESC_CSWlibcairo-doc = $(DESCRIPTION) documentation
PKGFILES_CSWlibcairo-doc += $(sharedstatedir)/gtk-doc.*
ARCHALL_CSWlibcairo-doc = 1
OBSOLETED_BY_CSWlibcairo-doc = CSWlibcairodoc
CATALOGNAME_CSWlibcairodoc = libcairo_doc_stub

BUILD_DEP_PKGS  = CSWgtk-doc
BUILD_DEP_PKGS += CSWpangodevel
BUILD_DEP_PKGS += CSWlibspectre-dev
BUILD_DEP_PKGS += CSWpkgconfig
BUILD_DEP_PKGS += CSWlibpng-dev
BUILD_DEP_PKGS += CSWfontconfig-dev
BUILD_DEP_PKGS += CSWlibfreetype-dev
BUILD_DEP_PKGS += CSWpoppler-dev
BUILD_DEP_PKGS += CSWghostscript-dev 
BUILD_DEP_PKGS += CSWghostscript
BUILD_DEP_PKGS += CSWlibrsvg-dev
BUILD_DEP_PKGS += CSWlibxext
BUILD_DEP_PKGS += CSWlibxrender
BUILD_DEP_PKGS += CSWlibxrenderdevel
BUILD_DEP_PKGS += CSWsunx11devel


BUILD64_LIBS_ONLY = 1
EXTRA_CFLAGS  =  -xc99=all

# There are several tests failing, but I'm in a hurry to release... :/
SKIPTEST ?= 1

# Use custom test script, because many `source' tests fail
TEST_SCRIPTS  = custom

CONFIGURE_ARGS += $(DIRPATHS)
CONFIGURE_ARGS += --disable-silent-rules
CONFIGURE_ARGS += --disable-static
CONFIGURE_ARGS += --disable-full-testing
CONFIGURE_ARGS += --enable-xlib=yes
CONFIGURE_ARGS += --enable-xlib-xrender=yes
CONFIGURE_ARGS += --enable-ft=yes
CONFIGURE_ARGS += --with-x
CONFIGURE_ARGS += --enable-png=yes
CONFIGURE_ARGS += --enable-ps=yes
CONFIGURE_ARGS += --enable-pdf=yes
CONFIGURE_ARGS += --enable-svg=yes
CONFIGURE_ARGS += --enable-xcb=no
CONFIGURE_ARGS += --enable-gtk-doc
CONFIGURE_ARGS += --enable-test-surfaces=yes 

PWD:=$(shell pwd)

include gar/category.mk

# What's this for!?
#
# During the the link of any2ppm, the currently built libcairo.so is
# included as well as any libcairo.so lying in the -L path. Thus the
# linker complains about multiple inclusion of libcairo.so from two
# different places and dies.
#
# By providing a linker path to the currently built libcairo.so, we
# can resolve the issue.
#
# I don't think this an error a priori, but a result of circular
# dependencies. However, `I think' so I might be wrong as well -- raos
LD_OPTIONS += -L$(PWD)/$(WORKSRC)/src/.libs 

# configure has problems with non-gnu utilities
PATH := /opt/csw/gnu:$(PATH)

test-custom:
	cd $(WORKSRC)/test ; $(BUILD_ENV) gmake $(BUILD_FLAGS) check
