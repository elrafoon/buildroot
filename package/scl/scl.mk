#############################################################
#
# scl
#
#############################################################
SCL_VERSION = HEAD
#SCL_SOURCE = SCL-$(SCL_VERSION).tar.gz
#SCL_SITE = ftp://download.dre.vanderbilt.edu/previous_versions
SCL_SITE = git://merlin.swind.sk/suzi/suhub-connector-light.git
SCL_SITE_METHOD = git
SCL_DEPENDENCIES = ACE 
SCL_INSTALL_STAGING = YES
SCL_INSTALL_TARGET = YES
LIBFOO_INSTALL_STAGING_OPT += -DINSTALL_HEADERS=ON
LIBFOO_INSTALL_TARGET_OPT += -DINSTALL_HEADERS=OFF


$(eval $(call CMAKETARGETS))

