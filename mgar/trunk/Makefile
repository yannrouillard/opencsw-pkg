# $Id$
# TODO (release-critical prefixed with !, non release-critical with *)
#
NAME = mgar
VERSION = 671
GARTYPE = v2

DESCRIPTION = Command line interface to the OpenCSW build system

VENDOR_URL = http://gar.opencsw.org
SVNROOT    = svn+proxy://svn.code.sf.net/p/opencsw/code/gar-wrapper
SVNREV     = $(VERSION)

ARCHALL = 1

RUNTIME_DEP_PKGS  = CSWnamazu
RUNTIME_DEP_PKGS += CSWack
RUNTIME_DEP_PKGS += CSWggrep
RUNTIME_DEP_PKGS += CSWfindutils
RUNTIME_DEP_PKGS += CSWgmake
RUNTIME_DEP_PKGS += CSWsvn
RUNTIME_DEP_PKGS += CSWbashcmplt
RUNTIME_DEP_PKGS += CSWpy-mako
RUNTIME_DEP_PKGS += CSWgar-dev # Meta pkg. Pulls in deps required by GAR.

CHECKPKG_OVERRIDES_CSWmgar += surplus-dependency

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS = custom
TEST_SCRIPTS =
INSTALL_SCRIPTS = custom

include gar/category.mk

build-custom:
	svn export --force -r $(SVNREV) $(SVNROOT)/ $(WORKSRC)
	a2x -d manpage -f manpage $(WORKSRC)/mgar.1.txt
	a2x -d manpage -f manpage $(WORKSRC)/mgar.5.txt
	$(MAKECOOKIE)

install-custom:
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5
	mkdir -p $(DESTDIR)$(prefix)/etc/bash_completion.d
	cp $(WORKSRC)/mgar $(DESTDIR)$(bindir)
	cp $(WORKSRC)/mgar.1 $(DESTDIR)$(mandir)/man1/
	cp $(WORKSRC)/mgar.5 $(DESTDIR)$(mandir)/man5/
	cp $(WORKSRC)/bash_completion.mgar \
		$(DESTDIR)$(prefix)/etc/bash_completion.d/mgar
	$(MAKECOOKIE)
