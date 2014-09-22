#############################################################
#
# SOCI
#
#############################################################
SOCI_VERSION = 3.2.2
SOCI_SOURCE = $(SOCI_VERSION).tar.gz
SOCI_SITE = https://github.com/SOCI/soci/archive/
SOCI_SUBDIR = src
SOCI_INSTALL_STAGING = YES
SOCI_INSTALL_TARGET = YES

ifeq ($(BR2_PREFER_STATIC_LIB),y)
	SOCI_CONF_OPT += -DSOCI_STATIC=ON
else
	SOCI_CONF_OPT += -DSOCI_STATIC=OFF
endif

ifeq ($(BR2_PACKAGE_SOCI_BOOST_INTEGRATION),y)
	SOCI_CONF_OPT += -DWITH_BOOST=ON
	SOCI_DEPENDENCIES += boost
endif

ifeq ($(BR2_PACKAGE_SOCI_BACKEND_MYSQL),y)
	SOCI_CONF_OPT += -DWITH_MYSQL=ON
	SOCI_DEPENDENCIES += mysql
endif

ifeq ($(BR2_PACKAGE_SOCI_BACKEND_SQLITE),y)
	SOCI_CONF_OPT += -DWITH_SQLITE3=ON
	SOCI_DEPENDENCIES += sqlite
endif

ifeq ($(BR2_PACKAGE_SOCI_BACKEND_ODBC),y)
	SOCI_CONF_OPT += -DWITH_ODBC=ON
	SOCI_DEPENDENCIES += unixodbc
endif

$(eval $(cmake-package))

