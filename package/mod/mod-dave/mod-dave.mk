#############################################################
#
# dave
#
#############################################################
MOD_DAVE_VERSION = 1
MOD_DAVE_SITE = package/mod/mod-dave
MOD_DAVE_SITE_METHOD = local
MOD_DAVE_INSTALL_STAGING = NO
MOD_DAVE_INSTALL_TARGET = YES
MOD_DAVE_DEPENDENCIES = mod-rtu

define MOD_DAVE_INSTALL_TARGET_CMDS
	rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/common/ $(TARGET_DIR)/
	[ ! -z $(BR2_MACHINE) ] && [ -d $(@D)/overlay/machine/$(BR2_MACHINE)/ ] && rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/machine/$(BR2_MACHINE)/ $(TARGET_DIR)/ || true
	INSTALL="$(INSTALL)" MOD="$(@D)/artifacts" TARGET_DIR="$(TARGET_DIR)" MACHINE=$(BR2_MACHINE) BRAND=$(BR2_PACKAGE_MOD_DAVE_BRAND) package/mod/mod-dave/mod-dave.sh
endef

$(eval $(generic-package))

