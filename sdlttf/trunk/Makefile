NAME = SDL_ttf
VERSION = 2.0.9
GARTYPE = v1

DESCRIPTION = TrueType font rendering library for SDL applications
define BLURB
  A sample library which allows you to use TrueType fonts in your SDL applications.
endef

MASTER_SITES = http://www.libsdl.org/projects/SDL_ttf/release/
DISTFILES  = $(NAME)-$(VERSION).tar.gz
DISTFILES += $(call admfiles,CSWsdlttf,)

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

#PATCHFILES = SDL_ttf.c.diff

TEST_SCRIPTS =
CONFIGURE_ARGS = $(DIRPATHS)

include gar/category.mk

#pre-configure:
#	( cd $(WORKSRC) ; ./autogen.sh )
#	@$(MAKECOOKIE)
