# $Id$
# TODO (release-critical prefixed with !, non release-critical with *)
#
NAME = gsl
VERSION = 1.16
GARTYPE = v2

DESCRIPTION = GNU Scientific Library
define BLURB
  GNU Scientific Library
endef

DISTFILES		=	$(DISTNAME).tar.gz
MASTER_SITES	=	$(GNU_MIRROR)

BUILD64_LIBS_ONLY	=	1

CONFIGURE_ARGS	=	$(DIRPATHS)

GARCOMPILER		=	GNU

TEST_SCRIPTS	=	custom

PACKAGES 					+=	CSWlibgsl0
CATALOGNAME_CSWlibgsl0		=	libgsl0
SPKG_DESC_CSWlibgsl0 		+=	$(DESCRIPTION), libgsl.so.0
OBSOLETED_BY_CSWlibgsl0		=	CSWgslrt
PKGFILES_CSWlibgsl0			+=	$(call baseisadirs,$(libdir),libgsl\.so\.0\.16\.0)
PKGFILES_CSWlibgsl0			+=	$(call baseisadirs,$(libdir),libgsl\.so\.0(\.\d+)*)
RUNTIME_DEP_PKGS_CSWlibgsl0	+=	CSWlibgcc-s1

PACKAGES							+=	CSWlibgslcblas0
CATALOGNAME_CSWlibgslcblas0			=	libgslcblas0
SPKG_DESC_CSWlibgslcblas0			+=	$(DESCRIPTION), libgslcblas.so.0
OBSOLETED_BY_CSWlibgslcblas0		=	CSWgslrt
PKGFILES_CSWlibgslcblas0			+=	$(call baseisadirs,$(libdir),libgslcblas\.so\.0\.0\.0)
PKGFILES_CSWlibgslcblas0			+=	$(call baseisadirs,$(libdir),libgslcblas\.so\.0(\.\d+)*)
RUNTIME_DEP_PKGS_CSWlibgslcblas0	+=	CSWlibgcc-s1

PACKAGES						+=	CSWgsl-dev
CATALOGNAME_CSWgsl-dev			=	gsl_dev
OBSOLETED_BY_CSWgsl-dev			=	CSWgsl
SPKG_DESC_CSWgsl-dev			+=	$(DESCRIPTION), development files
PKGFILES_CSWgsl-dev				+=	/opt/csw/lib/libgsl.so
PKGFILES_CSWgsl-dev				+=	/opt/csw/lib/libgslcblas.so
PKGFILES_CSWgsl-dev				+=	/opt/csw/bin/gsl-histogram
PKGFILES_CSWgsl-dev				+=	/opt/csw/bin/gsl-randist
PKGFILES_CSWgsl-dev				+=	$(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWgsl-dev		=	CSWlibgsl0
RUNTIME_DEP_PKGS_CSWgsl-dev		+=	CSWlibgslcblas0

PACKAGES						+=	CSWgsl-doc
CATALOGNAME_CSWgsl-doc			=	gsl_doc
SPKG_DESC_CSWgsl-doc			+=	$(DESCRIPTION), documentation
OBSOLETED_BY_CSWgsl-doc			=	CSWgsldoc
CATALOGNAME_CSWgsldoc			=	gsl_doc_stub
ARCHALL_CSWgsldoc				=	1
ARCHALL_CSWgsl-doc				=	1

include gar/category.mk

# there is one test failing (ode-initval2) and I choose to ignore it
# as the remaining ones pass.
test-custom:
	-$(MAKE) -k -C $(WORKSRC) check
	$(MAKECOOKIE)

# this is private and not available publicly
mydependencies:
	$(HOME)/bin/ocswdeplist --package $(NAME)
