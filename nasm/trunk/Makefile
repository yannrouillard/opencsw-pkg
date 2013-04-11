# : Makefile 9089 2010-03-11 08:34:46Z wahwah $
NAME = nasm
VERSION = 2.10.07
GARTYPE = v2

DESCRIPTION = The Netwide Assembler
define BLURB
endef

MASTER_SITES = http://www.nasm.us/pub/nasm/releasebuilds/$(VERSION)/
DISTFILES  = $(NAME)-$(VERSION).tar.xz

# File name regex to get notifications about upstream software releases
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.bz2

LICENSE = LICENSE

VENDOR_URL = http://www.nasm.us/

BUILD64 = 1
ISAEXEC = 1

TEST_TARGET = test

INSTALL_ARGS = INSTALLROOT=$(DESTDIR)

include gar/category.mk
