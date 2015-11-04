#############################################################
#
# bios
#
#############################################################
MOD_BIOS_SITE = package/mod/mod-bios
MOD_BIOS_SITE_METHOD = local
MOD_BIOS_VERSION = 1
MOD_BIOS_INSTALL_STAGING = NO
MOD_BIOS_INSTALL_TARGET = YES
MOD_BIOS_DEPENDENCIES = busybox

define MOD_BIOS_INSTALL_TARGET_CMDS
	rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/common/ $(TARGET_DIR)/
	[ ! -z $(BR2_MACHINE) ] && [ -d $(@D)/overlay/machine/$(BR2_MACHINE)/ ] && rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/machine/$(BR2_MACHINE)/ $(TARGET_DIR)/ || true
endef

$(eval $(generic-package))

