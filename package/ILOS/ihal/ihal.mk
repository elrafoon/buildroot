#############################################################
#
# ihal
#
#############################################################
IHAL_VERSION = testing
IHAL_SITE = git://merlin.swind.sk/ilos.git
IHAL_SITE_METHOD = git
IHAL_DEPENDENCIES = ACE pcre $(if $(BR2_PACKAGE_IHAL_BUILD_TESTS),gmock,)
IHAL_CONF_OPT = \
	-DBUILD_TESTS=$(if $(BR2_PACKAGE_IHAL_BUILD_TESTS),ON,OFF) \
	-DSYSCONFDIR=/etc

IHAL_INSTALL_STAGING = NO
IHAL_INSTALL_TARGET = YES
IHAL_SUBDIR = ihal

#Replace instance name
define IHAL_PI_SET_INSTANCE_NAME
	sed -i s/INSTANCE/$(BR2_PACKAGE_IHAL_INSTANCE)/ $(TARGET_DIR)/etc/ihal/svc.conf
endef

#Create directories on target
define IHAL_PI_MKDIRS
	mkdir -p $(TARGET_DIR)/var/lib/ihal $(TARGET_DIR)/var/lib/ihal/storage
endef

#Find all executable files in ihal-tests directory and list them in one script.
define IHAL_PI_GENERATE_TEST_RUNNER
    (rm -f $(TARGET_DIR)/usr/bin/ihal-tests/run-tests.sh; \
    echo '#!/bin/sh' > $(TARGET_DIR)/usr/bin/ihal-tests/run-tests.sh; \
    echo 'set -e' >> $(TARGET_DIR)/usr/bin/ihal-tests/run-tests.sh; \
    pushd $(TARGET_DIR)/usr/bin/ihal-tests; \
    find . -type f -executable >> run-tests.sh; \
    popd; \
    chmod 755 $(TARGET_DIR)/usr/bin/ihal-tests/run-tests.sh)
endef


IHAL_POST_INSTALL_TARGET_HOOKS += IHAL_PI_SET_INSTANCE_NAME
IHAL_POST_INSTALL_TARGET_HOOKS += IHAL_PI_MKDIRS
IHAL_POST_INSTALL_TARGET_HOOKS += IHAL_PI_GENERATE_TEST_RUNNER

$(eval $(call cmake-package))

