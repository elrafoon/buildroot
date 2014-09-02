#############################################################
#
# OPENDAF
#
#############################################################
OPENDAF_VERSION = master
OPENDAF_SITE_METHOD = git
OPENDAF_SITE = ssh://merlin.swind.sk:29418/OpenDAF.git
OPENDAF_INSTALL_STAGING = NO
OPENDAF_INSTALL_TARGET = YES
OPENDAF_DEPENDENCIES = ACE boost netsnmp host-protobuf protobuf

# setup per-platform settings
# generic
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_PLATFORM_GENERIC) += -DTARGET_PLATFORM=generic
# openbox
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_PLATFORM_OPENBOX) += -DTARGET_PLATFORM=openbox
# rtu
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_PLATFORM_RTU) += -DTARGET_PLATFORM=rtu
OPENDAF_DEPENDENCIES_$(BR2_PACKAGE_OPENDAF_PLATFORM_RTU) += i2c-tools

# setup configuration
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_CFG_PROD) += -DCONFIGURATION=prod
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_CFG_DEVEL) += -DCONFIGURATION=devel
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_CFG_NONE) += -DCONFIGURATION=none

# append additional depndencies
OPENDAF_DEPENDENCIES += $(OPENDAF_DEPENDENCIES_y)
# setup configuration options
OPENDAF_CONF_OPT += $(OPENDAF_CONF_OPT_y)


define OPENDAF_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 package/opendaf/S90opendaf $(TARGET_DIR)/etc/init.d/S90opendaf
endef

define OPENDAF_INSTALL_INIT_SYSTEMD
    $(INSTALL) -D -m 644 package/opendaf/opendaf.service $(TARGET_DIR)/etc/systemd/system/opendaf.service
    mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
    ln -fs ../dropbear.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/opendaf.service
endef

define OPENDAF_INSTALL_DEFAULT_CFG
	$(INSTALL) -D -m 0644 package/opendaf/opendaf.default $(TARGET_DIR)/etc/default/opendaf
endef

OPENDAF_POST_INSTALL_TARGET_HOOKS += OPENDAF_INSTALL_DEFAULT_CFG

$(eval $(cmake-package))

