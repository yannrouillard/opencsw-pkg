NAME = tmux
VERSION = 1.9
GARTYPE = v2

DESCRIPTION = Terminal Multiplexer

MASTER_SITES = $(SF_MIRRORS)
#MASTER_SITES += http://sourceforge.net/code-snapshots/git/u/u/u/dmichelsen/tmux.git/
#DISTNAME = tmux-tmux-code-ce52e45d44b38fcedfe27bce519ce6f4fc76a25d
DISTFILES  = $(DISTNAME).tar.gz

VENDOR_URL = http://tmux.sourceforge.net

BUILD_DEP_PKGS = CSWlibevent-dev

RUNTIME_DEP_PKGS = CSWlibevent2-0-5

# EXTRA_CPPFLAGS += -I/opt/csw/include/ncursesw
#EXTRA_CPPFLAGS += -D__inline=inline
# Grabbed from Solaris 10 /usr/include/iso/math_c99.h
#EXTRA_CPPFLAGS += -DINFINITY=__builtin_infinity

# Make sure tmux.conf is found in /etc/opt/csw as reported in #4696
#REINPLACEMENTS += tmuxconf
#REINPLACE_MATCH_tmuxconf = /etc/tmux\.conf
#REINPLACE_WITH_tmuxconf = $(sysconfdir)/tmux.conf
#REINPLACE_FILES_tmuxconf += tmux.h
#REINPLACE_FILES_tmuxconf += tmux.1

# CONFIGURE_ENV_PATH = /opt/csw/gnu:$(PATH)

PRESERVECONF += $(sysconfdir)/tmux.conf

include gar/category.mk

xxxpost-extract:
	cd $(WORKSRC) && ./autogen.sh
	@$(MAKECOOKIE)
