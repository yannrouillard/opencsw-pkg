NAME = rdesktop
VERSION = 1.8.0
GARTYPE = v2

DESCRIPTION = RDP client for Windows NT/2000/2003/XP Terminal Server
define BLURB
  rdesktop is an open source client for Windows Terminal Services, capable of natively
  speaking Remote Desktop Protocol (RDP) in order to present the user's Windows desktop.
  Supported servers include Windows 2000 Server, Windows Server 2003, Windows Server 2008,
  Windows XP, Windows Vista and Windows NT Server 4.0.
endef

MASTER_SITES = $(SF_MIRROR)
DISTFILES  = $(NAME)-$(VERSION).tar.gz

VENDOR_URL = http://www.rdesktop.org

BUILD_DEP_PKGS += CSWlibao-dev
BUILD_DEP_PKGS += CSWlibsamplerate-dev
BUILD_DEP_PKGS += CSWlibssl-dev
BUILD_DEP_PKGS += CSWlibgssglue-dev

PACKAGES += CSWrdesktop
SPKG_DESC_CSWrdesktop = RDP client for Windows NT/2000/2003/XP Terminal Server
RUNTIME_DEP_PKGS_CSWrdesktop += CSWlibiconv2
RUNTIME_DEP_PKGS_CSWrdesktop += CSWlibao4
RUNTIME_DEP_PKGS_CSWrdesktop += CSWlibsamplerate0
RUNTIME_DEP_PKGS_CSWrdesktop += CSWlibssl1-0-0
RUNTIME_DEP_PKGS_CSWrdesktop += CSWlibgssglue0

BUILD64 = 1
ISAEXEC = 1

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --with-openssl=$(prefix)

# We don't have that framework
CONFIGURE_ARGS += --disable-smartcard

# No test/check target provided by rdesktop
TEST_SCRIPTS =

# The path is just an example and nobody will probably look into it
CHECKPKG_OVERRIDES_CSWrdesktop += file-with-bad-content|/usr/local|root/opt/csw/share/rdesktop/keymaps/is

include gar/category.mk
