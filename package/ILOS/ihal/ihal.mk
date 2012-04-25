#############################################################
#
# ihal
#
#############################################################
IHAL_VERSION = testing
IHAL_SITE = git://merlin.swind.sk/ilos.git
IHAL_SITE_METHOD = git
IHAL_DEPENDENCIES = ACE
IHAL_CONF_OPT = \
    -DBUILD_TESTS=$(if $(BR2_PACKAGE_IHAL_BUILD_TESTS),ON,OFF)

IHAL_INSTALL_STAGING = YES
IHAL_INSTALL_TARGET = YES
IHAL_SUBDIR = ihal

define IHAL_INSTALL_STAGING_CMDS
    (cd $(@D)/ihal/scripts; /usr/bin/python gen-config.py)
    cp $(@D)/ihal/scripts/svc.conf $(@D)/ihal/etc/ihal/svc.conf
endef

define IHAL_PI_ADD_SVC_CONF
    $(INSTALL) -D -m 0644 $(@D)/ihal/etc/ihal/svc.conf $(TARGET_DIR)/etc/ihal/svc.conf
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


IHAL_POST_INSTALL_TARGET_HOOKS += IHAL_PI_ADD_SVC_CONF
IHAL_POST_INSTALL_TARGET_HOOKS += IHAL_PI_GENERATE_TEST_RUNNER

$(eval $(call CMAKETARGETS))

