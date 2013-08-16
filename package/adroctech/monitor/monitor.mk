#############################################################
#
# monitor
#
#############################################################
MONITOR_VERSION = 3877342
MONITOR_SITE = /home/stano/adroctech/monitor
MONITOR_SITE_METHOD = git
MONITOR_DEPENDENCIES = ACE pcre jpeg opencv qt
MONITOR_INSTALL_STAGING = NO
MONITOR_INSTALL_TARGET = YES
MONITOR_CONF_OPT += -DNO_BORDERS=ON -DTARGET_PLATFORM=T20 -DMONITOR_VERSION_HASH=${MONITOR_VERSION}

$(eval $(call cmake-package))

