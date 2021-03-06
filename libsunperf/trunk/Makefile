# $Id: Makefile 16916 2012-01-26 13:25:13Z dmichelsen $
NAME = libsunperf
VERSION = 20121030
GARTYPE = v2

DESCRIPTION = Sun Studio U1 Performance Libraries

MASTER_SITES = http://www.oracle.com/technetwork/server-storage/solarisstudio/documentation/
DISTFILES  = ss12u1-distributionreadme-429216.txt

VENDOR_URL = http://www.oracle.com/technetwork/server-storage/solarisstudio/documentation/ss12u1-distributionreadme-429216.txt

PACKAGING_PLATFORMS = solaris9-i386 solaris9-sparc
PACKAGING_PLATFORMS += solaris10-i386 solaris10-sparc

LICENSE = ss12u1-distributionreadme-429216.txt

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS =
TEST_SCRIPTS =
INSTALL_SCRIPTS = custom

# the .so versions are different on the different architectures
PACKAGES_sparc = CSWlibsunperf7
PACKAGES_i386 = CSWlibsunperf2 CSWlibsunperf3

PACKAGES = $(PACKAGES_$(GARCH))
SPKG_DESC_CSWlibsunperf7 = $(DESCRIPTION) - sparc
SPKG_DESC_CSWlibsunperf2 = $(DESCRIPTION) v2 - i386
PKGFILES_CSWlibsunperf2 = $(libdir)/.*2
SPKG_DESC_CSWlibsunperf3 = $(DESCRIPTION) v3 - i386
PKGFILES_CSWlibsunperf3 = $(libdir)/.*3

FLIBS-sparc  = libsunperf.so.7
FLIBS-i386 = libsunperf.so.2 libsunperf.so.3

RUNTIME_DEP_PKGS += CSWsunmath
RUNTIME_DEP_PKGS += CSWss12f95rt

CHECKPKG_OVERRIDES_CSWlibsunperf2 += bad-rpath-entry
CHECKPKG_OVERRIDES_CSWlibsunperf3 += bad-rpath-entry
CHECKPKG_OVERRIDES_CSWlibsunperf7 += bad-rpath-entry
CHECKPKG_OVERRIDES_CSWlibsunperf7 += soname-not-found
CHECKPKG_OVERRIDES_CSWlibsunperf7 += surplus-dependency|CSWss12f95rt
CHECKPKG_OVERRIDES_CSWlibsunperf7 += surplus-dependency|CSWsunmath

# They are binary blobs which we have no control of.
CHECKPKG_OVERRIDES_CSWlibsunperf2 += no-direct-binding
CHECKPKG_OVERRIDES_CSWlibsunperf3 += no-direct-binding
CHECKPKG_OVERRIDES_CSWlibsunperf7 += no-direct-binding

include gar/category.mk

SRCDIR-sparcv9 = v9
SRCDIR-amd64   = amd64

install-custom-i386:
	ginstall -d $(DESTDIR)$(libdir)
	$(foreach L,$(FLIBS-$(GARCH)),if [ -f $(SOS12_CC_HOME)/lib/$L ]; then ginstall $(SOS12_CC_HOME)/lib/$L $(DESTDIR)$(libdir)$(ISA_SS32-$(GARCH))/$L; fi;)
	@$(MAKECOOKIE)

install-custom-sparc:
	ginstall -d $(DESTDIR)$(libdir)
	ginstall -d $(DESTDIR)$(libdir)/v8
	ln -s v8/$(FLIBS-sparc) $(DESTDIR)$(libdir)/$(FLIBS-sparc)
	$(foreach L,$(FLIBS-$(GARCH)),if [ -f $(SOS12_CC_HOME)/lib/$L ]; then ginstall $(SOS12_CC_HOME)/lib/$L $(DESTDIR)$(libdir)$(ISA_SS32-$(GARCH))/v8/$L; fi;)
	@$(MAKECOOKIE)

install-custom: install-custom-$(GARCH)
	ginstall -d $(DESTDIR)$(libdir)/$(ISA_DEFAULT64)
	$(foreach L,$(FLIBS-$(GARCH)),if [ -f $(SOS12_CC_HOME)/lib/$(SRCDIR-$(ISA_DEFAULT64))/$L ]; then ginstall $(SOS12_CC_HOME)/lib/$(SRCDIR-$(ISA_DEFAULT64))/$L $(DESTDIR)$(libdir)/$(ISA_DEFAULT64)/$L; fi;)
	@$(MAKECOOKIE)
