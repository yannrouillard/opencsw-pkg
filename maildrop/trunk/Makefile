# : Makefile 9089 2010-03-11 08:34:46Z wahwah $
NAME = maildrop
VERSION = 2.4.3
GARTYPE = v2

DESCRIPTION = Mail delivery agent with filtering abilities
define BLURB
endef

SF_PROJECT = courier
MASTER_SITES = $(SF_MIRROR)
DISTFILES  = $(NAME)-$(VERSION).tar.bz2

# File name regex to get notifications about upstream software releases
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.bz2

DEP_PKGS = CSWlibidn CSWgdbm CSWpcrert

CONFIGURE_ARGS = $(DIRPATHS)

include gar/category.mk

# We need whoami
PATH := /opt/csw/gnu:$(PATH)
