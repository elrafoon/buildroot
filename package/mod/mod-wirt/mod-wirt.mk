#############################################################
#
# wirt
#
#############################################################
MOD_WIRT_VERSION = 1
MOD_WIRT_SITE = package/mod/mod-wirt
MOD_WIRT_SITE_METHOD = local
MOD_WIRT_INSTALL_STAGING = NO
MOD_WIRT_INSTALL_TARGET = YES
MOD_WIRT_DEPENDENCIES = systemd

ifeq ($(BR2_PACKAGE_MOD_WIRT_FULL), y)
MOD_WIRT_DEPENDENCIES += mod-rtu
endif

define MOD_WIRT_INSTALL_TARGET_CMDS_BASE
	rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/common/ $(TARGET_DIR)/;
	[ ! -z $(BR2_MACHINE) ] && [ -d $(@D)/overlay/machine/$(BR2_MACHINE)/ ] && rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/machine/$(BR2_MACHINE)/ $(TARGET_DIR)/ || true;
endef

define MOD_WIRT_INSTALL_TARGET_CMDS_APPSW
	INSTALL="$(INSTALL)" MOD="$(@D)/artifacts" TARGET_DIR="$(TARGET_DIR)" MACHINE=$(BR2_MACHINE) package/mod/mod-wirt/mod-wirt.sh;
endef

MOD_WIRT_INSTALL_TARGET_CMDS = $(MOD_WIRT_INSTALL_TARGET_CMDS_BASE)

ifeq ($(BR2_PACKAGE_MOD_WIRT_FULL), y)
MOD_WIRT_INSTALL_TARGET_CMDS += $(MOD_WIRT_INSTALL_TARGET_CMDS_APPSW)
endif

$(eval $(generic-package))

