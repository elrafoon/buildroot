################################################################################
#
# modem-tools
#
################################################################################

MODEM_TOOLS_SITE = gitolite@merlin.swind.sk:embedded-tools.git
MODEM_TOOLS_SITE_METHOD = git
MODEM_TOOLS_VERSION = 192c827
MODEM_TOOLS_DEPENDENCIES = dcron

define MODEM_TOOLS_INSTALL_MC_$(BR2_PACKAGE_MODEM_TOOLS_MC) 
	$(MAKE) -C $(@D)/modem-tools			\
		DESTDIR="$(TARGET_DIR)" 		\
		install-modem-check;
endef

ifneq ($(BR2_PACKAGE_MODEM_TOOLS_MC_PERIOD), 0)
	MODEM_TOOLS_INSTALL_MC_CRONTAB_$(BR2_PACKAGE_MODEM_TOOLS_MC) := echo "*/$(BR2_PACKAGE_MODEM_TOOLS_MC_PERIOD) * * * * /usr/sbin/modem-check" > $(TARGET_DIR)/etc/cron.d/modem-check;
else
	MODEM_TOOLS_INSTALL_MC_CRONTAB_$(BR2_PACKAGE_MODEM_TOOLS_MC) := rm -f $(TARGET_DIR)/etc/cron.d/modem-check
endif

MODEM_TOOLS_INSTALL_TARGET_CMDS += $(MODEM_TOOLS_INSTALL_MC_y)
MODEM_TOOLS_INSTALL_TARGET_CMDS += $(MODEM_TOOLS_INSTALL_MC_CRONTAB_y)

$(eval $(generic-package))

