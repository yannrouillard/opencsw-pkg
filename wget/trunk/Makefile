# TODO (release-critical prefixed with !, non release-critical with *)
# ! Make sure to honour these on an update:
#     http://www.mail-archive.com/pca@lists.univie.ac.at/msg02692.html
#     https://lists.gnu.org/archive/html/bug-wget/2011-09/msg00001.html

NAME = wget
VERSION = 1.15

DESCRIPTION = A network utility to retrieve files from the Web
define BLURB
  GNU Wget is a utility for noninteractive download of files from the Web. It
  supports HTTP and FTP protocols, as well as retrieval through HTTP proxies. It
  can follow HTML links, download many pages, and convert the links for local
  viewing. It can also mirror FTP hierarchies or only those files that have
  changed. Wget has been designed for robustness over slow network connections;
  if a download fails due to a network problem, it will keep retrying until the
  whole file has been retrieved.
endef

MASTER_SITES = $(GNU_MIRROR)
MASTER_SITES += ftp://alpha.gnu.org/gnu/wget/
DISTFILES = $(NAME)-$(VERSION).tar.xz

VENDOR_URL = http://www.gnu.org/software/wget/

PACKAGES += CSWwget
SPKG_DESC_CSWwget = A network utility to retrieve files from the web
RUNTIME_DEP_PKGS_CSWwget += CSWlibintl8
RUNTIME_DEP_PKGS_CSWwget += CSWlibiconv2
RUNTIME_DEP_PKGS_CSWwget += CSWlibz1
RUNTIME_DEP_PKGS_CSWwget += CSWlibssl1-0-0
RUNTIME_DEP_PKGS_CSWwget += CSWlibidn11
RUNTIME_DEP_PKGS_CSWwget += CSWlibpcre1
RUNTIME_DEP_PKGS_CSWwget += CSWlibuuid1

EXTRA_MODULATORS = STATIC
MODULATIONS_STATIC = disable enable

# Use the same CA as OpenSSL as reported in #4942
REINPLACEMENTS += capath
REINPLACE_MATCH_capath = /etc/ssl/certs
REINPLACE_WITH_capath = /etc/opt/csw/ssl/certs
REINPLACE_FILES_capath += src/gnutls.c

# Make sure our perl is used as the /usr/bin/perl lacks some needed modules
REINPLACEMENTS += cswperl
REINPLACE_MATCH_cswperl = \#!/usr/bin/env perl
REINPLACE_WITH_cswperl = \#!/opt/csw/bin/perl
REINPLACE_FILES_cswperl += tests/*.px
REINPLACE_FILES_cswperl += tests/run-px

EXTRA_CONFIGURE_STATIC-disable += --with-ssl
# NTLM can only be enabled when used with OpenSSL instead of the defaulting GnuTLS
#EXTRA_CONFIGURE_STATIC-disable += --enable-ntlm

EXTRA_CONFIGURE_STATIC-enable += --without-ssl
EXTRA_CONFIGURE_STATIC-enable += --disable-nls
EXTRA_CONFIGURE_STATIC-enable += --disable-iri

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += $(EXTRA_CONFIGURE_STATIC-$(STATIC))

# Switch back to OpenSSL as reported in
#   https://www.opencsw.org/mantis/view.php?id=4969
CONFIGURE_ARGS += --with-ssl=openssl

PRESERVECONF = $(sysconfdir)/wgetrc
MIGRATE_FILES = wgetrc

EXTRA_MERGE_EXCLUDE_FILES += $(libdir)/charset.alias

MERGE_SCRIPTS_isa-default-static-disable = copy-all
 MERGE_SCRIPTS_isa-default-static-enable = copy-static-wget-only
    MERGE_DIRS_isa-default-static-enable = $(bindir)

# This is ok, it is just one example occurrence, all others have been replaced
CHECKPKG_OVERRIDES_CSWwget += file-with-bad-content|/usr/local|root/opt/csw/share/info/wget.info

include gar/category.mk

merge-copy-static-wget-only:
	ginstall $(INSTALLISADIR)$(bindir)/wget $(PKGROOT)$(bindir)/wget.static
	@$(MAKECOOKIE)

post-install-modulated:
	perl -pi -e 's,/usr/local/etc,$(sysconfdir),g' \
		$(DESTDIR)$(infodir)/wget.info \
		$(DESTDIR)$(mandir)/man1/wget.1 \
		$(DESTDIR)$(sysconfdir)/wgetrc
