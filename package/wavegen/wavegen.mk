WAVEGEN_VERSION = master
WAVEGEN_SITE = ssh://merlin.swind.sk:29418/embedded-tools.git
WAVEGEN_SITE_METHOD = git
WAVEGEN_SUBDIR = wavegen
WAVEGEN_DEPENDENCIES = python
WAVEGEN_INSTALL_STAGING = no
WAVEGEN_INSTALL_TARGET = yes

$(eval $(cmake-package))

