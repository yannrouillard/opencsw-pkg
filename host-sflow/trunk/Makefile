NAME = hsflowd
VERSION = 1.19
GARTYPE = v2

PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

DESCRIPTION = monitoring agent using sFlow protocol
define BLURB
  The Host sFlow agent exports physical and virtual server performance
  metrics using the sFlow protocol. The agent provides scalable,
  multi-vendor, multi-OS performance monitoring with minimal impact
  on the systems being monitored.
endef

SF_PROJECT = host-sflow
MASTER_SITES = $(SF_MIRRORS)
DISTFILES  = $(NAME)-$(VERSION).tar.gz

BUILD64_LIBS_ONLY = 1

include gar/category.mk

