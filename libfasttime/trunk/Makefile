NAME = libfasttime
VERSION = 1.0
GARTYPE = v2

DESCRIPTION = a optimized, caching time() library function
define BLURB
  See for details: http://developers.sun.com/solaris/articles/time_stamp.html 
endef

MASTER_SITES = http://metis.utfs.org/html/csw/
DISTFILES  = $(NAME)-$(VERSION).tar.gz

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

# If the url used to check for software update is different of MASTER_SITES, then 
# uncomment the next line. Otherwise it is set by default to the value of MASTER_SITES
# UPSTREAM_MASTER_SITES = 

CONFIGURE_ARGS = $(DIRPATHS)

include gar/category.mk
