ifeq ($(AMD_DEBUG),)
	_DBG=@
else
	_DBG=
endif   

AMD_BASE  = $(WORKROOTDIR)/install-isa-i386-5.10-i386/
I386_BASE = $(WORKROOTDIR)/install-isa-i386-5.8-i386/
MPREFIX   = opt/csw/gcc4
APREFIX   = $(AMD_BASE)/$(MPREFIX)
IPREFIX   = $(I386_BASE)/$(MPREFIX)
PPREFIX   = $(PKGROOT)/$(MPREFIX)

AMD_MERGE_TARGETS  = merge-dirs-amd
AMD_MERGE_TARGETS += merge-i386-files
AMD_MERGE_TARGETS += merge-amd64-files

merge-amd: $(AMD_MERGE_TARGETS)
	$(_DBG)$(MAKECOOKIE)

merge-dirs-amd:
	$(_DBG)(ginstall -d $(PKGROOT))
	$(_DBG)(ginstall -d $(PPREFIX)/bin/amd64)
	$(_DBG)(ginstall -d $(PPREFIX)/bin/i386)
	$(_DBG)$(MAKECOOKIE)

merge-amd64-files:
	@echo "[===== Merging isa-amd64 =====]"
	$(_DBG)(cd $(AMD_BASE); for dir in `gfind . -name "*solaris2\.10*" -type d` ; do \
		/usr/bin/pax -rw $$dir $(PKGROOT); done )
	$(_DBG)(cd $(AMD_BASE); /usr/bin/pax -rw $(MPREFIX)/lib/amd64 $(PKGROOT))
	$(_DBG)(cd $(APREFIX)/bin; /usr/bin/pax -rw * $(PPREFIX)/bin/amd64)
	$(_DBG)$(MAKECOOKIE)

merge-i386-files:
	@echo "[===== Merging isa-i386 =====]"
	$(_DBG)(cd $(I386_BASE); /usr/bin/pax -rw $(MPREFIX)/bin $(PKGROOT))
	$(_DBG)(gmv -f $(PPREFIX)/bin/i386-pc* $(PPREFIX)/bin/i386/)
	$(_DBG)(cd $(I386_BASE); /usr/bin/pax -rw $(MPREFIX)/include $(PKGROOT))
	$(_DBG)(cd $(I386_BASE); /usr/bin/pax -rw $(MPREFIX)/info $(PKGROOT))
	$(_DBG)(cd $(I386_BASE); /usr/bin/pax -rw $(MPREFIX)/man $(PKGROOT))
	$(_DBG)(cd $(I386_BASE); /usr/bin/pax -rw $(MPREFIX)/share $(PKGROOT))
	$(_DBG)(cd $(I386_BASE); /usr/bin/pax -rw $(MPREFIX)/lib $(PKGROOT))
	$(_DBG)(cd $(I386_BASE); /usr/bin/pax -rw $(MPREFIX)/libexec $(PKGROOT))
	$(_DBG)$(MAKECOOKIE)

ifeq ($(shell uname -p), i386)
ISAEXEC_DIRS   = /opt/csw/gcc4/bin
ISAEXEC_FILES += /opt/csw/gcc4/bin/gcc
ISAEXEC_FILES += /opt/csw/gcc4/bin/gcov
ISAEXEC_FILES += /opt/csw/gcc4/bin/gccbug
ISAEXEC_FILES += /opt/csw/gcc4/bin/gfortran
ISAEXEC_FILES += /opt/csw/gcc4/bin/c++
ISAEXEC_FILES += /opt/csw/gcc4/bin/g++
ISAEXEC_FILES += /opt/csw/gcc4/bin/cpp
ISAEXEC_FILES += /opt/csw/gcc4/bin/addr2name.awk
ISAEXEC_FILES += /opt/csw/gcc4/bin/gc-analyze
ISAEXEC_FILES += /opt/csw/gcc4/bin/gcjh
ISAEXEC_FILES += /opt/csw/gcc4/bin/gjarsigner
ISAEXEC_FILES += /opt/csw/gcc4/bin/grmic
ISAEXEC_FILES += /opt/csw/gcc4/bin/gjavah
ISAEXEC_FILES += /opt/csw/gcc4/bin/grmid
ISAEXEC_FILES += /opt/csw/gcc4/bin/jcf-dump
ISAEXEC_FILES += /opt/csw/gcc4/bin/gkeytool
ISAEXEC_FILES += /opt/csw/gcc4/bin/grmiregistry
ISAEXEC_FILES += /opt/csw/gcc4/bin/jv-convert
ISAEXEC_FILES += /opt/csw/gcc4/bin/gcj
ISAEXEC_FILES += /opt/csw/gcc4/bin/gij
ISAEXEC_FILES += /opt/csw/gcc4/bin/gnative2ascii
ISAEXEC_FILES += /opt/csw/gcc4/bin/gserialver
ISAEXEC_FILES += /opt/csw/gcc4/bin/gappletviewer
ISAEXEC_FILES += /opt/csw/gcc4/bin/gcj-dbtool
ISAEXEC_FILES += /opt/csw/gcc4/bin/gjar
ISAEXEC_FILES += /opt/csw/gcc4/bin/gorbd
ISAEXEC_FILES += /opt/csw/gcc4/bin/gtnameserv
endif
