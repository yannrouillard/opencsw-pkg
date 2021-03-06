NAME = tme
VERSION = 0.6
GARTYPE = v1

DESCRIPTION = The Machine Emulator
define BLURB
  The Machine Emulator, or tme, provides a general-purpose
  framework for computer emulation. The goal is to create a
  large library of modules, each emulating a specific computer
  chip, or bus, or board, etc. These modules offer standard
  interfaces that allow you to connect them together to create
  a whole machine emulation with a minimum of effort.
endef

MASTER_SITES = http://people.csail.mit.edu/fredette/tme/
DISTFILES  = $(NAME)-$(VERSION).tar.gz

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

# -- ROM Images --

# Sun 2 Multibus Rev R ROM:
DISTFILES += sun2-multi-rev-R.bin
# Sun 3 Carrera Revision 3.0 ROM:
DISTFILES += sun3-carrera-rev-3.0.bin
# SPARCstation 2 Revision 2.9 ROM
DISTFILES += sun4-75-rev-2.9.bin
# SBus cgthree 501-1415 ROM
DISTFILES += SUNW,501-1415.bin
# SBus bwtwo 501-1561 ROM
DISTFILES += SUNW,501-1561.bin

DISTFILES += $(call admfiles,CSWtme,depend)

UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

PATCHFILES  = fix-tr.patch
PATCHFILES += fix-isinff.patch
PATCHFILES += fix-cfsetspeed.patch

GARCOMPILER = GNU
GARFLAVOR = DBG
SUN_CC_DBG = -g -xc99
GNU_CC_DBG = -g -std=c99

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --disable-shared
CONFIGURE_ARGS += --disable-warnings

TEST_SCRIPTS =

include gar/category.mk

#CFLAGS := $(CFLAGS) -m64

# To compile manually:
#   CC=gcc PATH=/opt/csw/gnu:$PATH CFLAGS="-L/opt/csw/lib -R/opt/csw/lib" LD_FLAGS="-L/opt/csw/lib -R/opt/csw/lib" ./configure --prefix=/opt/csw --with-gtk-prefix=/opt/csw --disable-shared && gmake
