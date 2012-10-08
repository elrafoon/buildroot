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

$(eval $(call CMAKETARGETS))

