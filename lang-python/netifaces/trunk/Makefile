# $Id$

NAME		=	netifaces
VERSION		=	0.8
CATEGORIES	=	python
GARTYPE		=	v2

DESCRIPTION	=	Portable network interface information
define BLURB
  netifaces provides a (hopefully portable-ish) way for Python programmers to
  get access to a list of the network interfaces on the local machine, and to
  obtain the addresses of those network interfaces.
endef

MASTER_SITES	=	http://alastairs-place.net/projects/netifaces/
DISTFILES 		=	$(DISTNAME).tar.gz

BUILD_DEP_PKGS	=	CSWpy-setuptools

CONFIGURE_ARGS	=	$(DIRPATHS)

RUNTIME_DEP_PKGS	+=	CSWlibgcc-s1
RUNTIME_DEP_PKGS	+=	CSWlibpython2-6-1-0
RUNTIME_DEP_PKGS	+=	CSWlibpython2-7-1-0

include gar/category.mk

