NAME = mod_highlight
VERSION = 0.1.0
GARTYPE = v1

DESCRIPTION = Syntax highlighting module for Apache 2.0
define BLURB
  mod_highlight provdes syntax highlighting as an Apache 2.0 Filter Module. By
  Embeding the Colorer-Take5 library the module can process just about any
  programing language.
endef

#DEPENDS = server/apache2

MASTER_SITES = http://www.outoforder.cc/downloads/$(NAME)/
DISTFILES  = $(NAME)-$(VERSION).tar.bz2
DISTFILES += CSWap2modhighlight.gspec
DISTFILES += CSWap2modhighlight.prototype CSWap2modhighlight.depend
DISTFILES += CSWap2modhighlight.postinstall CSWap2modhighlight.preremove

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.bz2

CONFIGURE_ARGS = $(DIRPATHS)
CONFIGURE_ARGS += --with-apxs=$(prefix)/apache2/sbin/apxs

include gar/category.mk
