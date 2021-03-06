#############################################################
#
# SERIAL_TEST
#
#############################################################
SERIAL_TEST_VERSION = master
SERIAL_TEST_SITE = ssh://merlin.swind.sk:29418/embedded-tools.git
SERIAL_TEST_SITE_METHOD = git
SERIAL_TEST_INSTALL_STAGING = NO
SERIAL_TEST_INSTALL_TARGET = YES
SERIAL_TEST_DEPENDENCIES = python-serial

SERIAL_TEST_CFGS_$(BR2_PACKAGE_SERIAL_TEST_CFG_IMX28) += serial_test-imx28.conf
SERIAL_TEST_CFGS_$(BR2_PACKAGE_SERIAL_TEST_CFG_IMX28_RTSCTS) += serial_test-imx28-rtscts.conf
SERIAL_TEST_CFGS_$(BR2_PACKAGE_SERIAL_TEST_CFG_AM3354) += serial_test-am3354.conf

define SERIAL_TEST_INSTALL_TARGET_CMDS
	for i in $(SERIAL_TEST_CFGS_y); do \
		$(INSTALL) -D -m 0644 $(@D)/serial_test/$$i $(TARGET_DIR)/etc/serial_test.conf; \
	done
	$(INSTALL) $(@D)/serial_test/serial_test.py $(TARGET_DIR)/usr/bin/serial_test.py
endef

$(eval $(generic-package))

