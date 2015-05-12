################################################################################
#
# heirloom-mailx
#
################################################################################

HEIRLOOM_MAILX_VERSION = 12.5
HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx

ifeq ($(BR2_PACKAGE_OPENSSL),y)
HEIRLOOM_MAILX_DEPENDENCIES += openssl
endif

define HEIRLOOM_MAILX_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SHELL) ./makeconfig)
endef

define HEIRLOOM_MAILX_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		SENDMAIL=/usr/sbin/sendmail
endef

define HEIRLOOM_MAILX_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		PREFIX=/usr \
		UCBINSTALL=$(INSTALL) \
		STRIP=/bin/true \
		DESTDIR=$(TARGET_DIR) \
		install
endef

# set e-mail encoding to UTF8
define HEIRLOOM_MAILX_SET_UTF8_$(BR2_PACKAGE_HEIRLOOM_MAILX_UTF8)
	sed -i s/sendcharsets=iso-8859-1,/sendcharsets=/ $(TARGET_DIR)/etc/nail.rc
	echo "set ttycharset=utf8" >> $(TARGET_DIR)/etc/nail.rc
	echo "set print-all-chars" >> $(TARGET_DIR)/etc/nail.rc
endef

HEIRLOOM_MAILX_POST_INSTALL_TARGET_HOOKS += HEIRLOOM_MAILX_SET_UTF8_y

$(eval $(generic-package))
