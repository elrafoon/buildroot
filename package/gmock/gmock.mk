#############################################################
#
# gmock
#
#############################################################

GMOCK_VERSION = HEAD
GMOCK_SITE = http://googlemock.googlecode.com/svn/trunk/
GMOCK_SITE_METHOD = svn

GMOCK_INSTALL_STAGING = YES
GMOCK_CONF_OPT = -DBUILD_SHARED_LIBS=ON

define GMOCK_INSTALL_STAGING_CMDS
    $(INSTALL) -D -m 0755 $(@D)/libgmock.so $(STAGING_DIR)/usr/lib
    $(INSTALL) -D -m 0755 $(@D)/libgmock_main.so $(STAGING_DIR)/usr/lib
    $(INSTALL) -D -m 0755 $(@D)/gtest/libgtest.so $(STAGING_DIR)/usr/lib
    $(INSTALL) -D -m 0755 $(@D)/gtest/libgtest_main.so $(STAGING_DIR)/usr/lib
    $(INSTALL) -D -m 0755 $(@D)/gtest/libgtest_main.so $(STAGING_DIR)/usr/lib

    $(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/gtest
    $(INSTALL) -m 0644 -t $(STAGING_DIR)/usr/include/gtest $(@D)/gtest/include/gtest/*.h
    $(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/gtest/internal
    $(INSTALL) -m 0644 -t $(STAGING_DIR)/usr/include/gtest/internal $(@D)/gtest/include/gtest/internal/*.h
    
    $(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/gmock
    $(INSTALL) -m 0644 -t $(STAGING_DIR)/usr/include/gmock $(@D)/include/gmock/*.h
    $(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/gmock/internal
    $(INSTALL) -m 0644 -t $(STAGING_DIR)/usr/include/gmock/internal $(@D)/include/gmock/internal/*.h
endef

define GMOCK_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/libgmock.so $(TARGET_DIR)/usr/lib
    $(INSTALL) -D -m 0755 $(@D)/libgmock_main.so $(TARGET_DIR)/usr/lib
    $(INSTALL) -D -m 0755 $(@D)/gtest/libgtest.so $(TARGET_DIR)/usr/lib
    $(INSTALL) -D -m 0755 $(@D)/gtest/libgtest_main.so $(TARGET_DIR)/usr/lib
endef


$(eval $(call cmake-package))
