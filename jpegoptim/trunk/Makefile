NAME = jpegoptim
VERSION = 1.3.0
GARTYPE = v2

DESCRIPTION = Utility to optimize jpeg files
define BLURB
  Utility to optimize jpeg files
endef

MASTER_SITES = http://www.kokkonen.net/tjko/src/
DISTFILES  = $(NAME)-$(VERSION).tar.gz

RUNTIME_DEP_PKGS += CSWlibjpeg7


TEST_TARGET =
INSTALL_SCRIPTS = custom

CONFIGURE_ARGS = $(DIRPATHS)

include gar/category.mk

SPKG_SOURCEURL = http://www.kokkonen.net/tjko/projects.html

install-custom:
	@echo " ==> Installing $(NAME) (custom)"
	@rm -rf $(DESTDIR)
	@ginstall -d $(DESTDIR)$(bindir)
	@ginstall -d $(DESTDIR)$(docdir)/$(NAME)
	@ginstall -d $(DESTDIR)$(mandir)/man1
	@( cd $(WORKSRC) ; \
	   cp -r $(NAME) $(DESTDIR)$(bindir)/$(NAME) ; \
	   cp -r README $(DESTDIR)$(docdir)/$(NAME) ; \
	   cp -r $(NAME).1 $(DESTDIR)$(mandir)/man1/$(NAME).1 )
	@$(MAKECOOKIE)
