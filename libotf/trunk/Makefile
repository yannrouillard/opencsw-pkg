# $Id$

NAME = libotf
VERSION = 0.9.13
GARTYPE = v2

DESCRIPTION = A Library for handling OpenType Font (OTF)
define BLURB
The library "libotf" provides the following facilites:

    o Read Open Type Layout Tables from OTF file.  Currently these
      tables are supported; head, name, cmap, GDEF, GSUB, and GPOS.

    o Convert a Unicode character sequence to a glyph code sequence by
      using the above tables.

The combination of libotf and the FreeType library (Ver.2) realizes
CTL (complex text layout) by OpenType fonts.
endef

MASTER_SITES = http://download.savannah.gnu.org/releases/m17n/
DISTFILES  = $(DISTNAME).tar.gz

# centralize the build dependencies (it seems that the run-time
# dependencies must be given for each package)
BUILD_DEP_PKGS		=	\
						CSWlibfreetype-dev \
						CSWlibz-dev \
						CSWlibbz2-dev

CONFIGURE_ARGS = $(DIRPATHS)
GARCOMPILER			=	GNU

PACKAGES					+=	CSWlibotf0
SPKG_DESC_CSWlibotf0		=	$(DESCRIPTION) - runtime
PKGFILES_CSWlibotf0			+=	$(call pkgfiles_lib,libotf.so.0.0.0)
OBSOLETED_BY_CSWlibotf0 	+=	CSWlibotf
RUNTIME_DEP_PKGS_CSWlibotf0	+=	\
								CSWlibfreetype6 \
								CSWlibgcc-s1
PACKAGES						+=	CSWlibotf-dev
SPKG_DESC_CSWlibotf-dev			=	$(DESCRIPTION) - development
PKGFILES_CSWlibotf-dev			=	$(PKGFILES_DEVEL)
CATALOGNAME_CSWlibotf-dev		=	libotf_dev
OBSOLETED_BY_CSWlibotf-dev		=	CSWlibotfdevel
RUNTIME_DEP_PKGS_CSWlibotf-dev	+=	CSWlibotf0

PACKAGES							+=	CSWlibotf-utils
SPKG_DESC_CSWlibotf-utils			=	$(DESCRIPTION) - utilities
CATALOGNAME_CSWlibotf-utils			=	libotf_utils
OBSOLETED_BY_CSWlibotf-utils		+=	CSWlibotf
RUNTIME_DEP_PKGS_CSWlibotf-utils	+=	\
										CSWlibotf0 \
										CSWlibfreetype6

include gar/category.mk

# this is private and not available publicly yet
mydependencies:
	$(HOME)/bin/ocswdeplist --package $(NAME)
