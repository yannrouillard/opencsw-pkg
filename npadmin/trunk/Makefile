NAME = npadmin
VERSION = 0.14
GARTYPE = v2

DESCRIPTION =  Command line SNMP based network adminstration tool for printers
define BLURB
endef

SF_PROJECT = lpr
MASTER_SITES = $(SF_MIRRORS)
DISTFILES  = $(NAME)-$(VERSION).tar.gz

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

SPKG_SOURCEURL = http://lpr.sourceforge.net/

ARCHALL = 1
CONFIGURE_ARGS = $(DIRPATHS)

include gar/category.mk

pre-configure-modulated:
	cd $(WORKSRC) && rm -f config.cache config.status
