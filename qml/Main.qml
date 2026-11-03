import QtQuick
import QtQuick.Window
import QtQuick.Shapes

Window {
            width: 1920
            height: 1080
            visible: true

            color: "#0D0E10"

            Rectangle {
                        anchors.fill: parent
                        color: "#0D0E10"

                        //=========================
                        // Top Bar
                        //=========================
                        Image {
                                    id: topbar

                                    source: Qt.resolvedUrl("assets/icons/TopBar.png")

                                    anchors.horizontalCenter: parent.horizontalCenter

                                    Row {

                                                anchors.centerIn: parent
                                                spacing: parent.width * 0.1

                                                Text {
                                                            text: Qt.formatTime(new Date(),"hh:mm")
                                                            color: "white"
                                                            font.pixelSize: 32
                                                }

                                                Text {
                                                            text: Qt.formatDate(new Date(),"dd MMM yyyy")
                                                            color: "#B0B5BC"
                                                            font.pixelSize: 32
                                                }

                                    }
                        }

                        //=========================
                        // Left Gauge
                        //=========================
                        SpeedGauge {
                            id: speedGauge

                            width: 550
                            height: 460

                            anchors {
                                left: parent.left
                                leftMargin: 141
                                verticalCenter: parent.verticalCenter
                            }

                            iconUrl: "assets/icons/Gauge180.png"
                            speed: 35
                            maxSpeed: 180
                        }

                        //=========================
                        // Fuel Gauge
                        //=========================
                        Gauge {
                                    id: fuelGauge

                                    width: parent.width * 0.02
                                    height: parent.height * 0.25

                                    value: 60
                                    iconSource: Qt.resolvedUrl("assets/icons/Fuel_level_nrml.png")
                                    iconSize: 40
                                    title: "Fuel Level"
                                    unit: "C"
                                    mirror: false

                                    anchors {
                                                left: parent.left
                                                leftMargin: 83

                                                top: parent.top
                                                topMargin: 43
                                    }
                        }

                        //=========================
                        // Battery Gauge
                        //=========================
                        Gauge {
                                    id: batteryGauge

                                    width: parent.width * 0.02
                                    height: parent.height * 0.25

                                    title: "Battery Level"

                                    value: 35
                                    iconSource: Qt.resolvedUrl("assets/icons/Battery_Level_nrml.png")
                                    mirror: false

                                    anchors {
                                                left: parent.left
                                                leftMargin: 83

                                                top: fuelGauge.bottom
                                                topMargin: batteryGauge.height * 0.7
                                    }
                        }

                        //=========================
                        // Oil Temperature
                        //=========================
                        Gauge {
                                    id: gauge3

                                    width: parent.width * 0.02
                                    height: parent.height * 0.25

                                    title: "Oil Temperature"

                                    value: 60
                                    iconSource: Qt.resolvedUrl("assets/icons/oil_temperature_nrml.svg")
                                    iconSize: 40
                                    mirror: true

                                    anchors {
                                                right: parent.right
                                                rightMargin: 83

                                                top: parent.top
                                                topMargin: 43
                                    }
                        }

                        //=========================
                        // Coolant Temperature
                        //=========================
                        Gauge {
                                    id: gauge4

                                    width: parent.width * 0.02
                                    height: parent.height * 0.25

                                    title: "Coolant Temperature"

                                    value: 35
                                    iconSource: Qt.resolvedUrl("assets/icons/coolant_temperature_nrml.svg")
                                    iconSize: 40
                                    mirror: true

                                    anchors {
                                                right: parent.right
                                                rightMargin: 83

                                                top: gauge3.bottom
                                                topMargin: gauge4.height * 0.7
                                    }
                        }

                        //=========================
                        // Center Panel
                        //=========================
                        CenterPanel {
                                    id: centerPanel

                                    anchors.centerIn: parent

                                    width: parent.width * 0.15
                                    height: parent.height * 0.45

                                    gearPosition: "D"
                                    driveMode: "AUTO"
                                    transmissionGear: 3
                                    vehicleSpeed: 68
                        }
            }

            //=========================
            // Right Gauge
            //=========================

            SpeedGauge {
                id: enginespeedgauge

                width: 550
                height: 460

                anchors {
                    right: parent.right
                    rightMargin: 141
                    verticalCenter: parent.verticalCenter
                }

                iconUrl: "assets/icons/Gauge_08.png"
                speed: 35
                maxSpeed: 80
            }

            //=========================
            // Bottom Bar
            //=========================
            Rectangle {
                        width: parent.width * 0.88
                        height: parent.height * 0.10

                        anchors {
                                    bottom: parent.bottom
                                    bottomMargin: 30

                                    horizontalCenter: parent.horizontalCenter
                        }

                        radius: 22

                        color: "#17191C"

                        border.width: 2
                        border.color: "#26292D"

                        Row {
                                    anchors.centerIn: parent
                                    spacing: 40

                                    Repeater {
                                                model: ["assets/icons/Battery_Level_nrml.png", "assets/icons/steering_yellow.png", "assets/icons/coolant_temperature_green.svg", "assets/icons/oil_pressure_nrml.svg", "assets/icons/oil_temperature_nrml.svg", "assets/icons/Fuel_level_red.png"]

                                                delegate: Image {
                                                            width: 50
                                                            height: 50

                                                            source: Qt.resolvedUrl(modelData)
                                                            fillMode: Image.PreserveAspectFit
                                                }
                                    }
                        }
            }
}
