NAME = balance
VERSION = 3.54
GARTYPE = v2

DESCRIPTION = A TCP proxy and load balancer
define BLURB
  Balance is a simple but powerful generic TCP proxy with round-robin load
  balancing and failover mechanisms. Its behaviour can be controlled at runtime
  using a simple command line syntax.
endef

MASTER_SITES = http://www.inlab.de/
DISTFILES  = $(NAME)-$(VERSION).tar.gz
PATCHFILES = 0001-Use-Solaris-and-CSW-layout.patch

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

VENDOR_URL = http://www.inlab.de/balance.html

CONFIGURE_SCRIPTS =

TEST_SCRIPTS =

include gar/category.mk
