#############################################################
#
# falcon
#
#############################################################
MOD_FALCON_VERSION = f9205f1
MOD_FALCON_SITE = gitolite@merlin.swind.sk:projekty/falcon.git
MOD_FALCON_SUBDIR = $(@D)/mod
MOD_FALCON_SITE_METHOD = git
MOD_FALCON_INSTALL_STAGING = NO
MOD_FALCON_INSTALL_TARGET = YES
MOD_FALCON_DEPENDENCIES = astroclock dcron crontab-cgi mod-rtu

define MOD_FALCON_INSTALL_TARGET_CMDS
	INSTALL="$(INSTALL)" MOD="$(MOD_FALCON_SUBDIR)" TARGET_DIR="$(TARGET_DIR)" MACHINE=$(BR2_MACHINE) package/mod/mod-falcon/mod-falcon.sh
endef

$(eval $(generic-package))

