#############################################################
#
# rqwb
#
#############################################################
RQWB_VERSION = master
RQWB_SITE = ssh://merlin.swind.sk:29418/embedded-tools
RQWB_SITE_METHOD = git
RQWB_SUBDIR = rqwb
RQWB_DEPENDENCIES = qt
RQWB_INSTALL_STAGING = NO
RQWB_INSTALL_TARGET = YES

$(eval $(call cmake-package))

