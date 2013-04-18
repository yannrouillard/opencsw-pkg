# $Id$
# TODO (release-critical prefixed with !, non release-critical with *)
#
NAME = m17n
VERSION = 1.6.4
GARTYPE = v2

DESCRIPTION = A multilingual text processing library for the C language.
define BLURB
    An open source software for any Linux/Unix applications which
	realizes multilingualization of many aspects of applications.

    It represents multilingual text as an object named M-text.
	M-text is a string with attributes called text properties,
	and designed to substitute for string in C.
	Text properties carry any information required to input, display
	and edit the text.
endef

MASTER_SITES = http://download.savannah.gnu.org/releases/m17n/

DISTNAME	=	$(NAME)-lib-$(VERSION)
DISTFILES	=	$(DISTNAME).tar.gz

CONFIGURE_ARGS = $(DIRPATHS)
GARCOMPILER			=	GNU
EXTRA_LINKER_FLAGS	=	-lintl
CONFIGURE_ARGS	+=	\
					--without-included-gettext \
					--with-libintl-prefix=/opt/csw
BUILD_DEP_PKGS		+=	CSWfconfig
BUILD_DEP_PKGS		+=	CSWlibbz2-dev
BUILD_DEP_PKGS		+=	CSWlibdatrie-dev
BUILD_DEP_PKGS		+=	CSWlibexpat-dev
BUILD_DEP_PKGS		+=	CSWlibfreetype-dev
BUILD_DEP_PKGS		+=	CSWlibfribidi-dev
BUILD_DEP_PKGS		+=	CSWlibiconv-dev
BUILD_DEP_PKGS		+=	CSWlibthai-dev
BUILD_DEP_PKGS		+=	CSWlibotf-dev
BUILD_DEP_PKGS		+=	CSWlibxft2devel
BUILD_DEP_PKGS		+=	CSWlibxml2-dev
BUILD_DEP_PKGS		+=	CSWlibxrenderdevel
BUILD_DEP_PKGS		+=	CSWlibz-dev

PACKAGES							+=	CSWlibm17n-utils
SPKG_DESC_CSWlibm17n-utils			+=	$(DESCRIPTION) - utilities.

PACKAGES							+=	CSWlibm17n-dev
SPKG_DESC_CSWlibm17n-dev			+=	$(DESCRIPTION) - development.
PKGFILES_CSWlibm17n-dev				=	$(PKGFILES_DEVEL)
CHECKPKG_OVERRIDES_CSWlibm17n-dev 	+= 	archall-devel-package
ARCHALL_CSWlibm17n-dev				=	1

include gar/category.mk

# this is private and not available publicly yet
mydependencies:
	$(HOME)/bin/ocswdeplist --package $(NAME)
