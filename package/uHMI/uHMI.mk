UHMI_VERSION = master
UHMI_SITE = ssh://merlin.swind.sk:29418/uHMI
UHMI_SITE_METHOD = git
UHMI_DEPENDENCIES = opendaf
UHMI_CONF_OPT = -DSCAN_PERIOD=$(BR2_PACKAGE_UHMI_SCAN_PERIOD)

$(eval $(cmake-package))

