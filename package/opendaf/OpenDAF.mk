#############################################################
#
# OPENDAF
#
#############################################################
OPENDAF_VERSION = 1764515
OPENDAF_SITE_METHOD = git
OPENDAF_SITE = gitolite@merlin.swind.sk:OpenDAF.git
OPENDAF_INSTALL_STAGING = NO
OPENDAF_INSTALL_TARGET = YES
OPENDAF_DEPENDENCIES = ACE boost netsnmp host-protobuf protobuf

# disable building all optional and configurable subdirectories
OPENDAF_CONF_OPT += -DBUILD_OPTIONAL_ALL=OFF -DBUILD_CONFIGURABLE_ALL=OFF

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

# connector stacks
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_GPIO) += -DINSTALL_STACK_C_GPIO=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_IEC_101_CONTROLLING_STATION) += -DINSTALL_STACK_C_IEC_101_CONTROLLING_STATION=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_IEC_104_CONTROLLING_STATION) += -DINSTALL_STACK_C_IEC_104_CONTROLLING_STATION=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_MODBUS_RTU_MASTER) += -DINSTALL_STACK_C_MODBUS_RTU_MASTER=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_MODBUS_TCP_MASTER) += -DINSTALL_STACK_C_MODBUS_TCP_MASTER=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_MONEZ_CLIENT) += -DINSTALL_STACK_C_MONEZ_CLIENT=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_O_GATE_CLIENT) += -DINSTALL_STACK_C_O_GATE_CLIENT=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_OGW_NOTIFY_CLIENT) += -DINSTALL_STACK_C_OGW_NOTIFY_CLIENT=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_PANTER) += -DINSTALL_STACK_C_PANTER=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_PERSISTOR) += -DINSTALL_STACK_C_PERSISTOR=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_ROMET_ECS) += -DINSTALL_STACK_C_ROMET_ECS=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_SIGNAL_GENERATOR) += -DINSTALL_STACK_C_SIGNAL_GENERATOR=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_SQL_CLIENT_EBO_DOSIMETRY) += -DINSTALL_STACK_C_SQL_CLIENT_EBO_DOSIMETRY=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_SUHUB_NOTIFY_CLIENT) += -DINSTALL_STACK_C_SUHUB_NOTIFY_CLIENT=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_SWTN_CONTROLLING_STATION) += -DINSTALL_STACK_C_SWTN_CONTROLLING_STATION=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_C_SNMP) += -DINSTALL_STACK_C_SNMP=ON

# provider stacks=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_P_CHEMIS_SERVER) += -DINSTALL_STACK_P_CHEMIS_SERVER=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_P_DAFLINK_PROVIDER) += -DINSTALL_STACK_P_DAFLINK_PROVIDER=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_P_IEC_101_CONTROLLED_STATION) += -DINSTALL_STACK_P_IEC_101_CONTROLLED_STATION=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_P_IEC_104_CONTROLLED_STATION) += -DINSTALL_STACK_P_IEC_104_CONTROLLED_STATION=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_P_MODBUS_RTU_SLAVE) += -DINSTALL_STACK_P_MODBUS_RTU_SLAVE=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_P_OGW_NOTIFY_SERVER) += -DINSTALL_STACK_P_OGW_NOTIFY_SERVER=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_P_SUHUB_NOTIFY_SERVER) += -DINSTALL_STACK_P_SUHUB_NOTIFY_SERVER=ON
OPENDAF_CONF_OPT_$(BR2_PACKAGE_OPENDAF_STACK_P_SQL_PROVIDER_EBO_DOSIMETRY) += -DINSTALL_STACK_P_SQL_PROVIDER_EBO_DOSIMETRY=ON
	
# append additional depndencies
OPENDAF_DEPENDENCIES += $(OPENDAF_DEPENDENCIES_y)
# setup configuration options
OPENDAF_CONF_OPT += $(OPENDAF_CONF_OPT_y)


define OPENDAF_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 package/opendaf/S90opendaf $(TARGET_DIR)/etc/init.d/S90opendaf
endef

define OPENDAF_SYSTEMD_BASE
    $(INSTALL) -D -m 0644 package/opendaf/opendaf.service $(TARGET_DIR)/etc/systemd/system/opendaf.service;
    $(INSTALL) -D -m 0644 package/opendaf/opendaf-archive.service $(TARGET_DIR)/etc/systemd/system/opendaf-archive.service;
    $(INSTALL) -D -m 0644 package/opendaf/opendaf-dafman.service $(TARGET_DIR)/etc/systemd/system/opendaf-dafman.service;
    $(INSTALL) -D -m 0644 package/opendaf/opendaf-dafmand.service $(TARGET_DIR)/etc/systemd/system/opendaf-dafmand.service;
    mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants;
    ln -fs ../opendaf.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/opendaf.service;
    rm -f $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/opendaf-archive.service;
endef

define OPENDAF_SYSTEMD_ARCHIVE_$(BR2_PACKAGE_OPENDAF_ARCHIVE)
    ln -fs ../opendaf-archive.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/opendaf-archive.service;
endef	

define OPENDAF_SYSTEMD_DAFMAN_$(BR2_PACKAGE_OPENDAF_DAFMAN)
    ln -fs ../opendaf-dafman.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/opendaf-dafman.service;
endef

define OPENDAF_SYSTEMD_DAFMAND_$(BR2_PACKAGE_OPENDAF_DAFMAND)
    ln -fs ../opendaf-dafmand.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/opendaf-dafmand.service;
endef

OPENDAF_INSTALL_INIT_SYSTEMD += $(OPENDAF_SYSTEMD_BASE)
OPENDAF_INSTALL_INIT_SYSTEMD += $(OPENDAF_SYSTEMD_ARCHIVE_y)
OPENDAF_INSTALL_INIT_SYSTEMD += $(OPENDAF_SYSTEMD_DAFMAN_y)
OPENDAF_INSTALL_INIT_SYSTEMD += $(OPENDAF_SYSTEMD_DAFMAND_y)

define OPENDAF_INSTALL_DEFAULT_CFG
	$(INSTALL) -D -m 0644 package/opendaf/opendaf.default $(TARGET_DIR)/etc/default/opendaf
endef

define OPENDAF_INSTALL_GPIO_DEF_PLACEHOLDER
	[ -e $(TARGET_DIR)/etc/default/opendaf-gpio ] || touch $(TARGET_DIR)/etc/default/opendaf-gpio
endef

OPENDAF_POST_INSTALL_TARGET_HOOKS += OPENDAF_INSTALL_DEFAULT_CFG
OPENDAF_POST_INSTALL_TARGET_HOOKS += OPENDAF_INSTALL_GPIO_DEF_PLACEHOLDER

$(eval $(cmake-package))

