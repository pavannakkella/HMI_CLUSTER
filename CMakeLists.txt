cmake_minimum_required(VERSION 3.16)

project(HMI_CLUSTER VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_add_executable(appHMI_CLUSTER
    main.cpp
)


qt_add_qml_module(
    appHMI_CLUSTER
    URI HMI_CLUSTER
    VERSION 1.0

    QML_FILES
    qml/Main.qml
        qml/Teltale.qml
        qml/TopBar.qml
        qml/Gauge.qml
        qml/CenterPanel.qml
        qml/SpeedGauge.qml


    RESOURCES
        qml/assets/icons/Battery_Level_green.png
        qml/assets/icons/Battery_Level_nrml.png
        qml/assets/icons/Battery_Level_red.png
        qml/assets/icons/Battery_Level_yellow.png
        qml/assets/icons/steering_nrml.png
        qml/assets/icons/steering_red.png
        qml/assets/icons/steering_yellow.png
        qml/assets/icons/TopBar.png
        qml/assets/icons/Coolant_Temperature.svg
        qml/assets/icons/coolant_temperature_green.svg
        qml/assets/icons/coolant_temperature_nrml.svg
        qml/assets/icons/coolant_temperature_yellow.svg
        qml/assets/icons/oil_pressure_green.svg
        qml/assets/icons/oil_pressure_nrml.svg
        qml/assets/icons/oil_pressure_red.svg
        qml/assets/icons/oil_pressure_yellow.svg
        qml/assets/icons/oil_temperature_green.svg
        qml/assets/icons/oil_temperature_nrml.svg
        qml/assets/icons/oil_temperature_red.svg
        qml/assets/icons/oil_temperature_yellow.svg

        qml/assets/icons/Top_Bar.png

        qml/assets/icons/Fuel_level_green.png
        qml/assets/icons/Fuel_level_nrml.png
        qml/assets/icons/Fuel_level_red.png
        qml/assets/icons/Fuel_level_yellow.png

        qml/assets/icons/Gauge_08.png
        qml/assets/icons/Gauge180.png
)
set_target_properties(appHMI_CLUSTER PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING
        ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHMI_CLUSTER
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)

install(TARGETS appHMI_CLUSTER
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
