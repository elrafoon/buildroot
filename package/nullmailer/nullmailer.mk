################################################################################
#
# nullmailer
#
################################################################################

NULLMAILER_VERSION = 1.13
NULLMAILER_SITE = http://untroubled.org/nullmailer/
NULLMAILER_LICENSE = GPLv2
NULLMAILER_LICENSE_FILES = COPYING
NULLMAILER_CONF_OPT = --localstatedir=/var/spool

ifeq ($(BR2_PACKAGE_GNUTLS),y)
	NULLMAILER_CONF_OPT += --enable-tls
	NULLMAILER_DEPENDENCIES += gnutls
endif

ifeq ($(BR2_PACKAGE_NULLMAILER_NULLMAILERSNMPD),y)
	NULLMAILER_CONF_OPT += \
		--with-net-snmp-config=$(STAGING_DIR)/usr/bin/net-snmp-config
	NULLMAILER_DEPENDENCIES += netsnmp
else
	NULLMAILER_CONF_OPT += --without-nullmailersnmpd
endif

define NULLMAILER_INSTALL_UTILS
	$(INSTALL) -D -m 755 package/nullmailer/nullmailer-send-syslog $(TARGET_DIR)/usr/sbin/nullmailer-send-syslog
endef

define NULLMAILER_INSTALL_INITSCRIPT
	$(INSTALL) -D -m 755 package/nullmailer/S65nullmailer $(TARGET_DIR)/etc/init.d/S65nullmailer
endef

NULLMAILER_POST_INSTALL_TARGET_HOOKS += NULLMAILER_INSTALL_UTILS
NULLMAILER_POST_INSTALL_TARGET_HOOKS += NULLMAILER_INSTALL_INITSCRIPT

$(eval $(autotools-package))
