#
# Long-term TODO:
# See branches/sync-pkgname for an attempt to sync the NIMOSS pkg name to
# the upstream name and split off a devel pkg.
#
NAME = libiconv
VERSION = 1.14
GARTYPE = bts

DESCRIPTION = GNU iconv library
define BLURB
  Some programs, like mailers and web browsers, must be able to convert
  between a given text encoding and the user's encoding. Other programs
  internally store strings in Unicode, to facilitate internal processing,
  and need to convert between internal string representation (Unicode) and
  external string representation (a traditional encoding) when they are
  doing I/O. GNU libiconv is a conversion library for both kinds of
  applications. 
endef

MASTER_SITES = $(GNU_MIRROR)
DISTFILES = $(DISTNAME).tar.gz

PACKAGES += NIMOSSlibiconv2
CATALOGNAME_NIMOSSlibiconv2 = libiconv2
SPKG_DESC_NIMOSSlibiconv2 = GNU iconv library, libiconv.so.2
PKGFILES_NIMOSSlibiconv2 += $(call pkgfiles_lib,libiconv.so.2)
OBSOLETED_BY_NIMOSSlibiconv2 += NIMOSSiconv

PACKAGES += NIMOSSlibcharset1
CATALOGNAME_NIMOSSlibcharset1 = libcharset1
SPKG_DESC_NIMOSSlibcharset1 = GNU iconv charset library, libcharset.so.1
PKGFILES_NIMOSSlibcharset1 += $(call pkgfiles_lib,libcharset.so.1)
# Now *this* time it is ok, iconv is the only package that is allowed to ship this!
CHECKPKG_OVERRIDES_NIMOSSlibcharset1 += disallowed-path|opt/csw/lib/charset.alias
PKGFILES_NIMOSSlibcharset1 += $(call baseisadirs,$(libdir),charset\.alias)
OBSOLETED_BY_NIMOSSlibcharset1 += NIMOSSiconv

PACKAGES += NIMOSSlibiconv-dev
CATALOGNAME_NIMOSSlibiconv-dev = libiconv_dev
SPKG_DESC_NIMOSSlibiconv-dev = Development files for libiconv.so.2
# PKGFILES is catchall
RUNTIME_DEP_PKGS_NIMOSSlibiconv-dev += NIMOSSlibiconv2
RUNTIME_DEP_PKGS_NIMOSSlibiconv-dev += NIMOSSlibcharset1
# This is from an example in a comment
CHECKPKG_OVERRIDES_NIMOSSlibiconv-dev += file-with-bad-content|/usr/local|root/opt/csw/include/iconv.h

PACKAGES += NIMOSSlibiconv-utils
CATALOGNAME_NIMOSSlibiconv-utils = libiconv_utils
SPKG_DESC_NIMOSSlibiconv-utils = GNU iconv utility programs
PKGFILES_NIMOSSlibiconv-utils += $(bindir)/.*
PKGFILES_NIMOSSlibiconv-utils += .*iconv\.1.*
PKGFILES_NIMOSSlibiconv-utils += .*/libiconv\.mo
PKGFILES_NIMOSSlibiconv-utils += $(call baseisadirs,$(libdir),preloadable_libiconv\.so)
# The SONAME of preloadable_libiconv.so is set to libiconv.so.0, although it doesn't
# matter in any way as this library is only used for LD_PRELOAD and is never being
# linked against during compile time.
CHECKPKG_OVERRIDES_NIMOSSlibiconv-utils += soname-not-part-of-filename|soname=libiconv.so.0|filename=preloadable_libiconv.so
CHECKPKG_OVERRIDES_NIMOSSlibiconv-utils += shared-lib-pkgname-mismatch
RUNTIME_DEP_PKGS_NIMOSSlibiconv-utils += NIMOSSlibiconv2
RUNTIME_DEP_PKGS_NIMOSSlibiconv-utils += NIMOSSlibintl8

# Removing this dependency to break a dependency cycle.
# See:
#  - http://lists.opencsw.org/pipermail/devel/2011-August/020098.html
#
# "NIMOSSiconv needs NIMOSSlibiconv-utils which needs NIMOSSlibintl8 which needs
# NIMOSSiconv"
#
# OBSOLETED_BY_NIMOSSlibiconv-utils += NIMOSSiconv

BUILD64_LIBS_ONLY = 1

# 'gmake test' shows three errors of coredumping printf's
#
#   ./check-translitfailure . TranslitFail1 ISO-8859-1 ASCII
#   ./check-subst
#   Segmentation Fault - core dumped
#   Segmentation Fault - core dumped
#   Segmentation Fault - core dumped
#   ./test-shiftseq
#
# This is due to bug #6550204
#   http://sunsolve.sun.com/search/document.do?assetkey=1-1-6550204-1
# and can safely be ignored as it is a failure in the testsuite.

EXTRA_CPPFLAGS = -D_REENTRANT

CONFIGURE_ARGS = $(DIRPATHS)
CONFIGURE_ARGS += --disable-rpath

include gar/category.mk

post-install-modulated: DOCDEST=$(DESTDIR)$(docdir)/$(NAME)
post-install-modulated:
	ginstall -d $(DOCDEST)
	cp $(FILEDIR)/changelog.NIMOSS $(DOCDEST)
	ginstall -D $(WORKSRC)/srcm4/iconv.m4 \
		$(DESTDIR)$(datadir)/aclocal/iconv.m4
	@$(MAKECOOKIE)

post-merge-all:
	@# Make the 64 bit charset-alias the same as the one for 32 bit
	rm -f $(PKGROOT)$(libdir)/$(ISA_DEFAULT64)/charset.alias
	gln -s ../charset.alias $(PKGROOT)$(libdir)/$(ISA_DEFAULT64)/charset.alias
	@$(MAKECOOKIE)
