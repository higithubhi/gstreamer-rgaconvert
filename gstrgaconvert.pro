CONFIG -= qt

TEMPLATE = lib


CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
INCLUDEPATH += $$[QT_SYSROOT]\usr\include\gstreamer-1.0  $$[QT_SYSROOT]\usr\include\glib-2.0 $$[QT_SYSROOT]/usr/lib/glib-2.0/include $$[QT_SYSROOT]\usr\include

LIBS += -lgstreamer-1.0 -lglib-2.0  -lgobject-2.0 -lgstvideo-1.0 -lgstallocators-1.0 -lrga

SOURCES += \
    plugins/gstrgaconvert.c \


HEADERS += \
    plugins/gstrgaconvert.h \

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target
