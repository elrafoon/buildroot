#############################################################
#
# suquation
#
#############################################################
SUQUATION_VERSION = HEAD
#SUQUATION_SOURCE = SUQUATION-$(SUQUATION_VERSION).tar.gz
#SUQUATION_SITE = ftp://download.dre.vanderbilt.edu/previous_versions
SUQUATION_SITE = git://merlin.swind.sk/suzi/suquation-runtime.git
SUQUATION_SITE_METHOD = git
SUQUATION_DEPENDENCIES = ACE boost xerces scl
SUQUATION_CONF_OPT += -DINSTALL_CONF_RUNIT=OFF -DINSTALL_CONF_RSYSLOG=OFF -DINSTALL_CONF_LOGROTATE=OFF -DINSTALL_CONF_SUQUATION=OFF -DINSTALL_CONF_LD_SO=OFF

define SUQUATION_PI_ADD_LD_SO
	echo /usr/lib/suquation >> $(TARGET_DIR)/etc/ld.so.conf
endef

SUQUATION_POST_INSTALL_TARGET_HOOKS += SUQUATION_PI_ADD_LD_SO

$(eval $(call cmake-package))

