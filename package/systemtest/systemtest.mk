################################################################################
#
# systemtest
#
################################################################################

SYSTEMTEST_SITE = gitolite@merlin.swind.sk:embedded-tools.git
SYSTEMTEST_SITE_METHOD = git
SYSTEMTEST_VERSION = 316f4cf

define SYSTEMTEST_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D)/systemtest			\
		DESTDIR="$(TARGET_DIR)" 		\
		MACHINE=$(BR2_MACHINE)			\
		install
endef

$(eval $(generic-package))

