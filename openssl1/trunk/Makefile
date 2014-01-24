#####################################################################
# OpenCSW build recipe for OpenSSL
#
# Copyright 2009 Yann Rouillard <yann@pleiades.fr.eu.org>
# All rights reserved.  Use is subject to license terms.
#
# Redistribution and/or use, with or without modification, is
# permitted.  This software is without warranty of any kind.  The
# author(s) shall not be liable in the event that use of the
# software causes damage.
#####################################################################

###### Package information #######

NAME = openssl
VERSION = 1.0.1f
GARTYPE = v2
SONAME=$(shell echo $(VERSION) | tr -d '[a-z]')

DESCRIPTION = The Open Source toolkit for SSL and TLS
define BLURB
  The OpenSSL Project is a collaborative effort to develop a robust,
  commercial-grade, fully featured, and Open Source toolkit implementing the
  Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) as well
  as a full-strength general-purpose cryptography library.
endef

PACKAGES = CSWlibssl1-0-0 CSWlibssl-dev CSWopenssl-utils

PACKAGING_PLATFORMS = solaris9-sparc solaris9-i386 solaris10-sparc solaris10-i386 solaris11-sparc solaris11-i386

SPKG_DESC_CSWlibssl1-0-0 = Openssl 1.0 runtime libraries
PKGFILES_CSWlibssl1-0-0 = $(PKGFILES_RT)
PKGFILES_CSWlibssl1-0-0 += $(libdir)(/amd64)?/openssl-1.0.0/engines/.*
PKGFILES_CSWlibssl1-0-0 += $(prefix)/etc/ssl/private $(prefix)/etc/ssl/certs 
PKGFILES_CSWlibssl1-0-0 += $(docdir)/libssl1_0_0/.* 

RUNTIME_DEP_PKGS_CSWlibssl-dev = CSWlibssl1-0-0
SPKG_DESC_CSWlibssl-dev = Openssl 1.0 development support files
PKGFILES_CSWlibssl-dev = $(PKGFILES_DEVEL) 
PKGFILES_CSWlibssl-dev += $(docdir)/libssl_dev/.*

RUNTIME_DEP_PKGS_CSWopenssl-utils = CSWlibssl1-0-0
SPKG_DESC_CSWopenssl-utils = Openssl 1.0 binaries and related tools
PKGFILES_CSWopenssl-utils = $(bindir)/[^/]* $(bindir)/.*/openssl 
PKGFILES_CSWopenssl-utils += $(mandir)/man1/.* $(mandir)/man5/.* $(mandir)/man7/.* 
PKGFILES_CSWopenssl-utils += $(prefix)/ssl/misc/.* 
PKGFILES_CSWopenssl-utils += $(prefix)/ssl/openssl\.cnf.*
PKGFILES_CSWopenssl-utils += $(sysconfdir)/ssl/openssl\.cnf.*
PKGFILES_CSWopenssl-utils += $(docdir)/openssl_utils/.*

PRESERVECONF = $(sysconfdir)/ssl/openssl.cnf

# We do ship libcrypto in libssl package
CHECKPKG_OVERRIDES_CSWlibssl1-0-0 += shared-lib-pkgname-mismatch|file=opt/csw/lib/libcrypto.so.1.0.0|soname=libcrypto.so.1.0.0|pkgname=CSWlibssl1-0-0|expected=CSWlibcrypto1-0-0
ifeq ($(shell /usr/bin/uname -p),sparc) 
CHECKPKG_OVERRIDES_CSWlibssl1-0-0 += shared-lib-pkgname-mismatch|file=opt/csw/lib/sparcv8plus+vis/libcrypto.so.1.0.0|soname=libcrypto.so.1.0.0|pkgname=CSWlibssl1-0-0|expected=CSWlibcrypto1-0-0
CHECKPKG_OVERRIDES_CSWlibssl1-0-0 += shared-lib-pkgname-mismatch|file=opt/csw/lib/sparcv9/libcrypto.so.1.0.0|soname=libcrypto.so.1.0.0|pkgname=CSWlibssl1-0-0|expected=CSWlibcrypto1-0-0
else
CHECKPKG_OVERRIDES_CSWlibssl1-0-0 += shared-lib-pkgname-mismatch|file=opt/csw/lib/amd64/libcrypto.so.1.0.0|soname=libcrypto.so.1.0.0|pkgname=CSWlibssl1-0-0|expected=CSWlibcrypto1-0-0
endif


# We use SUN perl, not the opencsw one
CHECKPKG_OVERRIDES_CSWopenssl-utils += missing-dependency|CSWperl

###### Upstream and opencsw files information #######

MASTER_SITES = http://www.openssl.org/source/

DISTFILES  = $(NAME)-$(VERSION).tar.gz 
DISTFILES += changelog.CSW README.CSW
DISTFILES += map.openssl.libcrypto map.openssl.libssl map.openssl.engines

DOCFILES = CHANGES CHANGES.SSLeay PROBLEMS README FAQ README.ASN1 INSTALL NEWS README.ENGINE

# List of engines that will be shipped in the packages
ENGINES = 4758cca aep atalla cswift gmp chil nuron sureware ubsec padlock capi

# configure targets patchs needs to be different for Solaris 9 as some map files
# are not available 
ifeq ($(shell /usr/bin/uname -r),5.9)
	PATCH_SUFFIX = .SunOS5.9
endif

# This patch is taken from https://hg.openindiana.org/upstream/oracle/userland-gate/ 
# original file: components/openssl/openssl-1.0.1/patches/18-compiler_opts.patch
# I think they are smarter than me to figure what are the best compiler options
PATCHFILES = optimized_configure_targets.patch$(PATCH_SUFFIX)

# This patch add optimised build targets for some solaris isa, ie:
# solaris-sparcv8-cc-sunw, solaris-pentium_pro-cc-sunw and solaris-sparcv9+vis-cc-sunw
# (wonder if they are really worth it)
PATCHFILES += more_configure_targets.patch$(PATCH_SUFFIX)

#PATCHFILES += fix-test-failure.patch

# We install engines libraries in /opt/csw/lib/engines/1.0.0/
# instead of /opt/csw/lib/engines to avoid clashes with 0.9.8
# and futur new release of ssl libraries
PATCHFILES += 0003-make-engines-directory-soname-dependant.patch

# Update openssl.cnf path in man page to follow opencsw standard
PATCHFILES += opencsw_paths.patch
#
# Let's always block some compromised CA, whatever the CA configured
# (patchs taken from Debian Package)
PATCHFILES += block_bad_certificates.patch

# Add old-style certificates hash generation to maintain compatibilies
# with gnutls and programs linked with openssl 0.9.8 
# Patch taken from Debian
PATCHFILES += c_rehash-compat.patch

# Oh yes, let's do symbol versioning so we don't become
# crazy during library migration
PATCHFILES += 0007-enables-symbols-versioning.patch

# openssl currently only uses issetugid on freebsd and openbsd 
# althought it is also available on Solaris 10
# We make issetugid support configurable via preprocessor flag
# to be able to enable it for Solaris
# Bug opened upstream: http://rt.openssl.org/Ticket/Display.html?id=3153
PATCHFILES += make_issetugid_support_configurable.patch

# support for pkcs11 engine http://blogs.sun.com/chichang1/entry/how_to_integrate_pkcs11_engine
ifneq ($(shell /usr/bin/uname -r),5.9)
       PATCHFILES += openssl-1.0.1f-pkcs11-engine.patch
       ENGINES += pk11
endif

# support for sparc t4 crypto engine 
# see http://bubbva.blogspot.fr/2011/11/exciting-crypto-advances-with-t4.html
#     https://blogs.oracle.com/DanX/entry/sparc_t4_openssl_engine
# patch taken from https://hg.openindiana.org/upstream/oracle/userland-gate/
# To update the patch, do:
#   cd files && ./update-t4-patch.sh OPENSSL_VERSION
#
PATCHFILES.sparc.5.11 += openssl-1.0.1f-t4-engine.sparc.5.11.patch
PATCHFILES.sparc.5.11 += openssl-1.0.1e-t4-engine-sparcv9+vis.sparc.5.11.patch

PATCHFILES += $(PATCHFILES.$(GARCH).$(GAROSREL))


LICENSE = LICENSE

##### Build and installation information #####

BUILD64 = 1
ISAEXEC = 1

# The list of instructions set for which we will 
# provide optimized libraries and binaries
EXTRA_BUILD_ISAS_i386 = pentium_pro amd64
EXTRA_BUILD_ISAS_sparc = sparcv8plus+vis sparcv9


# the openssl build system doesn't honor bindir
# as it doesn't install 64 bits binaries in bin/{amd64,sparcv9}
# we fix this at the merge step 
EXTRA_MERGE_DIRS_isa-amd64 = $(bindir_install)
EXTRA_MERGE_DIRS_isa-sparcv9 = $(bindir_install)

# c_rehash is shell script: no isaexec please
EXTRA_ISAEXEC_EXCLUDE_FILES = /opt/csw/bin/c_rehash

# We use Studio 12.3 to have the "-Qoption cg" option
# but this version is not available under Solaris 9
ifneq ($(shell /usr/bin/uname -r),5.9)
	GARCOMPILER=SOS12U3
endif

# The corresponding os/compiler to pass to the
# openssl Configure script
i386_OS_COMPILER 	= no-sse2 solaris-x86-cc-sunw
pentium_pro_OS_COMPILER	= solaris-x86-pentium_pro-cc-sunw
amd64_OS_COMPILER 	= solaris64-x86_64-cc-sunw

sparcv8_OS_COMPILER 		= solaris-sparcv8-cc-sunw
sparcv8plus_OS_COMPILER		= solaris-sparcv9-cc-sunw
sparcv8plus+vis_OS_COMPILER	= solaris-sparcv9+vis-cc-sunw
sparcv9_OS_COMPILER		= solaris64-sparcv9-cc-sunw

# Solaris has the issetugid function since libc version interface SUNW_1.21
# but openssl doesn't use it by default so we manually enable it
CONFIGURE_FLAGS = -DHAVE_ISSETUGID

# PKCS11 Patch also works on sparc64 athena processors thanks for the FJAES 
# instruction set. The presence of this instruction set is checked at runtime
# by looking for the AV_SPARC_JFAES instruction set bit, unfortunately the
# corresponding macro in not present in Solaris 9-11 headers, so we manually 
# define it.
CONFIGURE_FLAGS += -DAV_SPARC_FJAES=0

# --libdir must only be given if the directory is actually different from lib or the creation will fail
# as the directory is already there
LIBDIR_64 = --libdir=lib/64
LIBDIR = $(LIBDIR_$(MEMORYMODEL))

CONFIGURE_ARGS = --prefix=$(prefix) shared $(CONFIGURE_FLAGS) $($(ISA)_OS_COMPILER) --install_prefix=$(DESTDIR) $(LIBDIR)

# PKCS11 is only for Solaris 10 so we must create solaris 10 specific packages
ifneq ($(shell /usr/bin/uname -r),5.9)
# There is a problem with this patch under sparc when using tls protocol
# See https://www.opencsw.org/mantis/view.php?id=5098
	CONFIGURE_ARGS += --pk11-libname=$(abspath /usr/lib/$(MM_LIBDIR)/libpkcs11.so) 
endif 

# For now we want the sun perl to be used
EXTRA_CONFIGURE_ENV += PERL="/usr/bin/perl"

# Configure uses make and sun make is not happy
# with the shell command added by the t4 patch
EXTRA_CONFIGURE_ENV += MAKE="/opt/csw/bin/gmake"

# The new compiler options taken from https://hg.openindiana.org/upstream/oracle/userland-gate/ 
# added "-z defs" to the linker options. That causes object compilation to fail because
# they are not linked against libc and libdl (for Sol9). This is workaround until I find a better fix.
EXTRA_LD_OPTIONS = -lc -ldl

# By default, the install target put man pages under
# /opt/csw/ssl/man, but we want them under /opt/csw/share/man
EXTRA_INSTALL_ARGS += MANDIR=$(mandir)

# library files are not automatically stripped
STRIP_DIRS = $(DESTDIR)/$(libdir) $(DESTDIR)/$(libdir)/openssl-$(SONAME)/engines/

TEST_SCRIPTS = 


include gar/category.mk

# We remove SSE2 hardware capability in the elf header of libcrypto as
# openssl is able to select it at runtime and the Solaris OS support SSE2 since
# Solaris 9 4/04 (according to "Sun Studio 12: C++ User's Guide")
post-install:
	if command -v elfedit >/dev/null 2>&1 && [ "$(GARCH)" = "i386" ]; then \
		echo " ==> Removing the SSE2 hardware capability from libcrypto"; \
		chmod +w "$(DESTDIR)/$(libdir)/libcrypto.so.1.0.0"; \
		elfedit -e 'cap:hw1 -and -cmp sse2' "$(DESTDIR)/$(libdir)/libcrypto.so.1.0.0"; \
	fi
	@$(MAKECOOKIE)

pre-configure-modulated:
	echo " ==> Creating configure script"
	cd $(WORKSRC) && ln -nf Configure configure
	ln -nf $(WORKDIR)/map.openssl.libcrypto $(WORKSRC)/map.openssl.libcrypto 
	ln -nf $(WORKDIR)/map.openssl.libssl $(WORKSRC)/map.openssl.libssl 
	for ENGINE in 4758cca aep atalla cswift gmp chil nuron sureware ubsec padlock capi pk11; do \
		ln -nf $(WORKDIR)/map.openssl.engines $(WORKSRC)/engines/map.openssl.lib$$ENGINE; \
	done 
	ln -nf $(WORKDIR)/map.openssl.engines $(WORKSRC)/engines/ccgost/map.openssl.libgost
	@$(MAKECOOKIE)

install-conf-misc: 
	if [ -f "$(PKGROOT)$(prefix)/ssl/openssl.cnf" ] && [ ! -h "$(PKGROOT)$(prefix)/ssl/openssl.cnf" ]; then \
		ginstall -d "$(PKGROOT)$(sysconfdir)/ssl"; \
		mv "$(PKGROOT)$(prefix)/ssl/openssl.cnf" $(PKGROOT)$(sysconfdir)/ssl/openssl.cnf.CSW; \
		ln -sf ../../..$(sysconfdir)/ssl/openssl.cnf $(PKGROOT)$(prefix)/ssl/openssl.cnf; \
	fi	
	[ ! -d "$(PKGROOT)$(sysconfdir)/ssl/misc" ] || \
		mv "$(PKGROOT)$(sysconfdir)/ssl/misc" "$(PKGROOT)/$(prefix)/ssl/"

merge-doc:
	for CATALOGNAME in $(foreach PKG, $(PACKAGES), $(call catalogname,$(PKG))); do \
		ginstall -d $(PKGROOT)/$(docdir)/$$CATALOGNAME; \
		(cd $(DOWNLOADDIR)/ && ginstall -m 0644 README.CSW changelog.CSW $(PKGROOT)/$(docdir)/$$CATALOGNAME/); \
		(cd $(WORKSRC_FIRSTMOD)/ && ginstall -m 0644 $(DOCFILES) $(PKGROOT)/$(docdir)/$$CATALOGNAME/); \
	done
	@$(MAKECOOKIE)

post-merge-all: merge-doc install-conf-misc 

