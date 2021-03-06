NAME = siege
VERSION = 2.69
GARTYPE = v2

DESCRIPTION = A http regression testing and benchmarking utility
define BLURB
  Siege is an http regression testing and benchmarking utility. It was
  designed to let web developers measure the performance of their code
  under duress, to see how it will stand up to load on the internet. It
  lets the user hit a web server with a configurable number of
  concurrent simulated users.
endef

MASTER_SITES = ftp://sid.joedog.org/pub/siege/
DISTFILES  = $(NAME)-$(VERSION).tar.gz

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

# we require
RUNTIME_DEP_PKGS = CSWlibssl1-0-0

# the references are located in comments and are harmless, so the errors can be ignored
CHECKPKG_OVERRIDES_CSWsiege += file-with-bad-content|/usr/local|root/opt/csw/bin/siege.config
CHECKPKG_OVERRIDES_CSWsiege += file-with-bad-content|/usr/local|root/opt/csw/share/man/man5/urls_txt.5
CHECKPKG_OVERRIDES_CSWsiege += file-with-bad-content|/usr/local|root/opt/csw/share/man/man1/siege.1
CHECKPKG_OVERRIDES_CSWsiege += file-with-bad-content|/export/home|root/opt/csw/bin/siege.config

# We use SUNW perl and not CSW perl
CHECKPKG_OVERRIDES_CSWsiege += missing-dependency|CSWperl

# handle config file
PRESERVECONF = $(sysconfdir)/urls.txt

# patch bombardment
PATCHFILES  = patch-bombardment.in
PATCHFILES += patch-configure
PATCHFILES += patch-auth.c

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --with-ssl=$(prefix)

# No need to depend on opencsw perl for the simple
# perl script sieve2csv.pl
EXTRA_CONFIGURE_ENV += PERL="/usr/bin/perl"


# no build tests
SKIPTEST = 1

INSTALL_SCRIPTS = bin man additional

include gar/category.mk

pre-configure-modulated:
	gsed -ie 's,^LIBTOOL=.*,LIBTOOL=/opt/csw/bin/libtool,' \
		$(WORKSRC)/configure
	@$(MAKECOOKIE)

x-post-configure-modulated:
	find $(WORKSRC) -name Makefile | xargs grep -l '^CFLAGS' \
		| xargs perl -pi -e 's@CFLAGS =@CFLAGS = $(CFLAGS)@'
	@$(MAKECOOKIE)

# install is broken..
bin-list  = $(WORKSRC)/src/siege
bin-list += $(WORKSRC)/utils/bombardment
bin-list += $(WORKSRC)/utils/siege2csv.pl
bin-list += $(WORKSRC)/utils/siege.config
share-list  = $(WORKSRC)/doc/urls.txt
share-list += $(WORKSRC)/doc/siegerc

install-bin:
	ginstall -d $(DESTDIR)$(bindir)
	@( for file in $(bin-list) ; do \
		ginstall -m 751 $$file $(DESTDIR)$(bindir) ; \
			done )
	@$(MAKECOOKIE)

install-additional:
	ginstall -d $(DESTDIR)$(sysconfdir)
	ginstall -m 644 $(WORKSRC)/doc/urls.txt \
		$(DESTDIR)$(sysconfdir)/urls.txt
	@$(MAKECOOKIE)

install-man:
	ginstall -d $(DESTDIR)$(mandir)/man1
	ginstall -m 644 $(WORKSRC)/doc/siege.1 $(DESTDIR)$(mandir)/man1
	ginstall -m 644 $(WORKSRC)/doc/bombardment.1 $(DESTDIR)$(mandir)/man1
	ginstall -m 644 $(WORKSRC)/doc/siege2csv.1 $(DESTDIR)$(mandir)/man1
	ginstall -d $(DESTDIR)$(mandir)/man5
	ginstall -m 644 $(WORKSRC)/doc/urls_txt.5 $(DESTDIR)$(mandir)/man5
	ginstall -d $(DESTDIR)$(mandir)/man7
	ginstall -m 644 $(WORKSRC)/doc/layingsiege.7 $(DESTDIR)$(mandir)/man7
	@$(MAKECOOKIE)
