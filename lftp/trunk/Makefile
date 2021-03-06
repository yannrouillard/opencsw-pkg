#####################################################################
# OpenCSW build recipe for lftp
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

NAME = lftp
VERSION = 4.4.15
GARTYPE = v2

DESCRIPTION = A sophisticated command-line ftp/http client
define BLURB
   lftp is a sophisticated command line based file transfer program. Supported protocols include FTP, HTTP, SFTP, and FISH. It has a multithreaded design allowing you to issue and execute multiple commands simultaneously or in the background. It also features mirroring capabilities and will reconnect and continue transfers in the event of a disconnection. Also, if you quit the program while transfers are still in progress, it will switch to nohup mode and finish the transfers in the background. Additional protocols supported: FTP over HTTP proxy, HTTPS and FTP over SSL. There are lots of tunable parameters, including rate limitation, number of connections limitation and more.
endef

PACKAGES = CSWlftp

BUILD_DEP_PKGS = CSWgcc4g++

RUNTIME_DEP_PKGS = CSWlibexpat1
RUNTIME_DEP_PKGS += CSWlibiconv2
RUNTIME_DEP_PKGS += CSWlibssl1-0-0
RUNTIME_DEP_PKGS += CSWlibsocks
RUNTIME_DEP_PKGS += CSWlibintl8
RUNTIME_DEP_PKGS += CSWlibreadline6
RUNTIME_DEP_PKGS += CSWlibz1
# necessary when compiled with gcc
RUNTIME_DEP_PKGS += CSWlibgcc-s1
RUNTIME_DEP_PKGS += CSWlibstdc++6

PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

###### Upstream and opencsw files information #######

MASTER_SITES = http://lftp.yar.ru/ftp/

DISTFILES  = $(NAME)-$(VERSION).tar.gz
DISTFILES += CSWlftp.cswreleasenotes

# do some type conversion before munmap call
# so lftp can be compiled with sun cc 
# (patch only mandatory to compile with gnutls)
#PATCHFILES = munmap.patch

# Update the system-wide lftp.conf path in the man page
PATCHFILES += 0007-update-configuration-files-paths-in-documentation.patch

PRESERVECONF = $(sysconfdir)/lftp.conf
MIGRATE_FILES_CSWlftp = lftp.conf

EXTRA_MERGE_EXCLUDE_FILES  = .*/charset.alias

##### Build and installation information #####

GARCOMPILER = GNU

# We don't want Sun Studio RPATH entries
# see http://wiki.opencsw.org/checkpkg-error-tags#bad-rpath-entry
ifeq ($(GARCOMPILER),SUN)
	EXTRA_LINKER_FLAGS = -norunpath
endif

CONFIGURE_ARGS = $(DIRPATHS)

# previous maintainer compiled with openssl
# instead of gnutls, no need to change that
CONFIGURE_ARGS += --without-gnutls --with-openssl=/opt/csw
# Requested see https://www.opencsw.org/mantis/view.php?id=4481
CONFIGURE_ARGS += --with-socksdante

# For an unknown reason so far, lftp crashes when compiled
# with compiled with lazyload enabled
EXTRA_LD_OPTIONS = -z nolazyload

# No test suite here
TEST_SCRIPTS =


include gar/category.mk

# we re-run autoconf because we patched a m4 file
#pre-configure-modulated:
#	cd $(WORKSRC) && autoconf
#	@$(MAKECOOKIE)

