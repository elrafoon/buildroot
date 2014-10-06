#############################################################
#
# OPENDAF
#
#############################################################
OPENDAF_VERSION = master
OPENDAF_SITE_METHOD = git
OPENDAF_SITE = gitolite@merlin.swind.sk:OpenDAF.git
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

# dafman[d]
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_DAFMAN) += -DBUILD_DAFMAN=ON
OPENDAF_DEPENDENCIES_$(BR2_PACKAGE_OPENDAF_DAFMAN) += soci
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_DAFMAND) += -DBUILD_DAFMAND=ON
OPENDAF_DEPENDENCIES_$(BR2_PACKAGE_OPENDAF_DAFMAND) += glibmm

# append additional depndencies
OPENDAF_DEPENDENCIES += $(OPENDAF_DEPENDENCIES_y)
# setup configuration options
OPENDAF_CONF_OPT += $(OPENDAF_CONF_OPT_y)


define OPENDAF_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 package/opendaf/S90opendaf $(TARGET_DIR)/etc/init.d/S90opendaf
endef

define OPENDAF_INSTALL_INIT_SYSTEMD
    $(INSTALL) -D -m 0644 package/opendaf/opendaf.service $(TARGET_DIR)/etc/systemd/system/opendaf.service
    $(INSTALL) -D -m 0644 package/opendaf/opendaf-archive.service $(TARGET_DIR)/etc/systemd/system/opendaf-archive.service
    $(INSTALL) -D -m 0644 package/opendaf/opendaf-dafman.service $(TARGET_DIR)/etc/systemd/system/opendaf-dafman.service
    mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
    ln -fs ../opendaf.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/opendaf.service
    ln -fs ../opendaf-archive.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/opendaf-archive.service
    ln -fs ../opendaf-dafman.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/opendaf-dafman.service
endef

define OPENDAF_INSTALL_DEFAULT_CFG
	$(INSTALL) -D -m 0644 package/opendaf/opendaf.default $(TARGET_DIR)/etc/default/opendaf
endef

OPENDAF_POST_INSTALL_TARGET_HOOKS += OPENDAF_INSTALL_DEFAULT_CFG

$(eval $(cmake-package))

