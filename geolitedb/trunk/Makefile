NAME = geolitedb
VERSION = 20131022
GARTYPE = v2

DESCRIPTION = Geolite country database

MASTER_SITES += http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/
MASTER_SITES += http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/
MASTER_SITES += http://download.maxmind.com/download/geoip/database/asnum/
MASTER_SITES += http://geolite.maxmind.com/download/geoip/database/

DISTFILES += GeoIP.dat.gz
DISTFILES += GeoIPv6.dat.gz
DISTFILES += GeoLiteCity.dat.xz
DISTFILES += GeoLiteCityv6.dat.gz
DISTFILES += GeoIPASNum.dat.gz
DISTFILES += GeoIPASNumv6.dat.gz
DISTFILES += GeoLite2-City.mmdb.gz
DISTFILES += GeoLite2-Country.mmdb.gz
DISTFILES += COPYING

VENDOR_URL = http://dev.maxmind.com/geoip/legacy/geolite/

ARCHALL = 1

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS =
TEST_SCRIPTS =
INSTALL_SCRIPTS = custom

include gar/category.mk

install-custom:
	@echo " ==> Installing $(NAME)"
	ginstall -d $(DESTDIR)/opt/csw/share/GeoIP
	ginstall $(WORKDIR)/GeoIP.dat $(DESTDIR)/opt/csw/share/GeoIP/GeoIP.dat
	ginstall $(WORKDIR)/GeoIPv6.dat $(DESTDIR)/opt/csw/share/GeoIP/GeoIPv6.dat
	ginstall $(WORKDIR)/GeoLiteCity.dat $(DESTDIR)/opt/csw/share/GeoIP/GeoIPCity.dat
	ginstall $(WORKDIR)/GeoLiteCityv6.dat $(DESTDIR)/opt/csw/share/GeoIP/GeoIPCityv6.dat
	ginstall $(WORKDIR)/GeoIPASNum.dat $(DESTDIR)/opt/csw/share/GeoIP/GeoIPASNum.dat
	ginstall $(WORKDIR)/GeoIPASNumv6.dat $(DESTDIR)/opt/csw/share/GeoIP/GeoIPASNumv6.dat
	ginstall $(WORKDIR)/GeoLite2-City.mmdb $(DESTDIR)/opt/csw/share/GeoIP/GeoLite2-City.mmdb
	ginstall $(WORKDIR)/GeoLite2-Country.mmdb $(DESTDIR)/opt/csw/share/GeoIP/GeoLite2-Country.mmdb
	@$(MAKECOOKIE)
