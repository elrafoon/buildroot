#############################################################
#
# JT
#
#############################################################
JT_VERSION = 1.0
JT_SOURCE = jt-$(JT_VERSION).tgz
JT_SITE = ftp://merlin.swind.sk/buildroot-packages/
JT_INSTALL_STAGING = NO
JT_INSTALL_TARGET = YES
JT_DEPENDENCIES = jpeg

define JT_BUILD_CMDS
	echo TARGET_CC=$(TARGET_CC)	
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/jt-decompress $(@D)/decompress.c -ljpeg
endef

define JT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/jt-decompress $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0644 $(@D)/test.jpg $(TARGET_DIR)/root/test.jpg
	$(INSTALL) -D -m 0755 $(@D)/test.sh $(TARGET_DIR)/root/test.sh
endef

$(eval $(generic-package))

