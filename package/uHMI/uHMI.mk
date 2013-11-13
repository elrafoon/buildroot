UHMI_VERSION = master
UHMI_SITE = ssh://merlin.swind.sk:29418/uHMI
UHMI_SITE_METHOD = git
UHMI_DEPENDENCIES = opendaf

$(eval $(cmake-package))

