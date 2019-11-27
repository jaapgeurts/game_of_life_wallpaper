add_definitions(-DTRANSLATION_DOMAIN=\"plasma_wallpaper_org.kde.plasma.life_wallpaper\")

set(life_wallpaperplugin_SRCS
    life_wallpaperplugin.cpp
    gameoflife.cpp
)

add_library(life_wallpaperplugin SHARED ${life_wallpaperplugin_SRCS})

target_link_libraries(life_wallpaperplugin
    KF5::I18n
    Qt5::Gui
    Qt5::Qml
    Qt5::Quick
)
install(TARGETS life_wallpaperplugin DESTINATION ${KDE_INSTALL_QMLDIR}/org/kde/plasma/private/life_wallpaper)
install(FILES qmldir DESTINATION ${KDE_INSTALL_QMLDIR}/org/kde/plasma/private/life_wallpaper)
