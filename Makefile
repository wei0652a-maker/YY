ARCHS = arm64
TARGET = iphone:clang:latest:13.0
include $(THEOS)/makefiles/common.mk
LIBRARY_NAME = YYModelStandalone
YYModelStandalone_FILES = Sources/StandaloneUI.m Sources/StandaloneMetal.m Sources/StandaloneSupport.m Sources/StandaloneBootstrap.m
YYModelStandalone_FRAMEWORKS = Foundation UIKit WebKit Metal MetalKit QuartzCore
YYModelStandalone_CFLAGS = -fobjc-arc -I./Sources
YYModelStandalone_INSTALL_PATH = /usr/local/lib
include $(THEOS_MAKE_PATH)/library.mk
