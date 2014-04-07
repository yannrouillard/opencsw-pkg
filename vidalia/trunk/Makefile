NAME = vidalia
VERSION = 0.2.20
GARTYPE = v2

DESCRIPTION = Controller GUI for Tor
define BLURB
Vidalia lets you start and stop Tor, see how much bandwidth you are consuming, see how many circuits you currently have active, see where these circuits are connected on a global map, view messages from Tor about its progress and current state, and let you configure your Tor client, bridge, or relay with a simple interface. Included in Vidalia is an extensive help system which helps you understand all of the options available to you. All of these features are translated into a large number of languages.
endef

MASTER_SITES = https://www.torproject.org/dist/vidalia/
DISTFILES  = $(DISTNAME).tar.gz

LICENSE = LICENSE

# no patches so lets skip this to save a little time
NOGITPATCH = 1

RUNTIME_DEP_PKGS_CSWvidalia += CSWlibqtxml4
RUNTIME_DEP_PKGS_CSWvidalia += CSWlibqtnetwork4
RUNTIME_DEP_PKGS_CSWvidalia += CSWlibqtcore4
RUNTIME_DEP_PKGS_CSWvidalia += CSWlibstdc++6
RUNTIME_DEP_PKGS_CSWvidalia += CSWlibqtgui4
RUNTIME_DEP_PKGS_CSWvidalia += CSWlibgcc-s1

GARCOMPILER = GNU

TEST_SCRIPTS =

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = custom
INSTALL_SCRIPTS = custom

PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

include gar/category.mk

configure-custom:
	mkdir $(WORKSRC)/build
	cd $(WORKSRC)/build && CC=gcc /opt/csw/bin/cmake \
	-DCMAKE_INSTALL_PREFIX:PATH=/opt/csw \
	-DCMAKE_INSTALL_RPATH:PATH=/opt/csw/lib:/opt/csw/gxx/lib \
	-DCMAKE_EXE_LINKER_FLAGS:STRING='-lsocket -lnsl' \
	-DCMAKE_INCLUDE_PATH:PATH=/opt/csw/include \
	-DCMAKE_CXX_COMPILER=/opt/csw/bin/g++ \
	-DQT_QMAKE_EXECUTABLE=/opt/csw/gxx/bin/qmake ..
	@$(MAKECOOKIE)

build-custom:
	cd $(WORKSRC)/build && LD_OPTIONS=-Bdirect /opt/csw/bin/gmake
	@$(MAKECOOKIE)

install-custom:
	cd $(WORKSRC)/build && /opt/csw/bin/gmake install DESTDIR=$(DESTDIR)
	@$(MAKECOOKIE)
