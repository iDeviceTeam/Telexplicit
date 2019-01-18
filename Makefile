include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Telexplicit
Telexplicit_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/Tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
