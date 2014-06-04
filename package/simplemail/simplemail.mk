#############################################################
#
# SIMPLEMAIL
#
#############################################################
SIMPLEMAIL_VERSION = master
SIMPLEMAIL_SITE_METHOD = git
SIMPLEMAIL_SITE = gitolite@merlin.swind.sk:embedded-tools
SIMPLEMAIL_SUBDIR = simplemail
SIMPLEMAIL_INSTALL_STAGING = NO
SIMPLEMAIL_INSTALL_TARGET = YES
SIMPLEMAIL_DEPENDENCIES = heirloom-mailx

define SIMPLEMAIL_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D)/$(SIMPLEMAIL_SUBDIR) DESTDIR=$(TARGET_DIR) install
endef

define SIMPLEMAIL_UNINSTALL_TARGET_CMDS
	$(MAKE) -C $(@D)/$(SIMPLEMAIL_SUBDIR) DESTDIR=$(TARGET_DIR) uninstall
endef

$(eval $(generic-package))

