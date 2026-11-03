import QtQuick

Rectangle {
    id: root

    width: 320
    height: 480

    radius: 26

    color: "#181A1D"

    border.width: 2
    border.color: "#32353A"

    //========================================
    // Properties
    //========================================

    property string gearPosition: "D"       // P R N D
    property string driveMode: "AUTO"       // AUTO / MANUAL
    property int transmissionGear: 3

    property real vehicleSpeed: 68

    //========================================
    // Gear Position
    //========================================

    Row {

        id: gearRow

        anchors {
            top: parent.top
            topMargin: 18
            horizontalCenter: parent.horizontalCenter
        }

        spacing: 28

        Repeater {

            model: ["P","R","N","D"]

            delegate: Rectangle {

                width: 42
                height: 42

                radius: 21

                color: modelData === root.gearPosition
                       ? "#204C34"
                       : "transparent"

                border.width: modelData === root.gearPosition ? 1 : 0
                border.color: "#3FCF7F"

                scale: modelData === root.gearPosition ? 1.08 : 1.0

                Behavior on scale {
                    NumberAnimation {
                        duration: 180
                        easing.type: Easing.OutBack
                    }
                }

                Text {

                    anchors.centerIn: parent

                    text: modelData

                    color: modelData === root.gearPosition
                           ? "white"
                           : "#6C7278"

                    font.pixelSize: 24
                    font.bold: true
                }
            }
        }
    }

    //========================================
    // Mode Badge
    //========================================

    Rectangle {

        id: modeBadge

        width: 110
        height: 38

        radius: 19

        anchors {

            top: gearRow.bottom
            topMargin: 22

            horizontalCenter: parent.horizontalCenter
        }

        color: root.driveMode === "AUTO"
               ? "#173624"
               : "#5A3A00"

        border.width: 1
        border.color: root.driveMode === "AUTO"
                      ? "#3FCF7F"
                      : "#FFB000"

        Text {

            anchors.centerIn: parent

            text: root.driveMode

            color: "white"

            font.pixelSize: 18
            font.bold: true
        }
    }

    //========================================
    // Vehicle Speed
    //========================================

    Column {
        id:speedbar

        anchors {

            top: modeBadge.bottom
            topMargin: 20

            horizontalCenter: parent.horizontalCenter
        }

        spacing: 4

        Text {

            text: Number(root.vehicleSpeed)

            color: "white"

            font.pixelSize: 72
            font.bold: Font.DemiBold
        }

        Text {

            anchors.horizontalCenter: parent.horizontalCenter

            text: "km/h"

            color: "#8E9399"

            font.pixelSize: 18
        }
    }

    //========================================
    // Current Gear
    //========================================

    Row {

        anchors {

            top: speedbar.bottom
            topMargin: 50

            horizontalCenter: parent.horizontalCenter
        }

        spacing: 8

        Text {

            text: "GEAR"

            color: "#7B8187"

            font.pixelSize: 18

            font.letterSpacing: 2

            anchors.verticalCenter: parent.verticalCenter
        }

        Text {

            text: root.transmissionGear

            color: "#FFFFFF"

            font.pixelSize: 30

            font.bold: true
        }
    }

    //========================================
    // Divider
    //========================================

    Rectangle {

        width: parent.width * 0.82

        height: 1

        color: "#32353A"

        anchors {

            bottom: tripInfo.top
            bottomMargin: 18

            horizontalCenter: parent.horizontalCenter
        }
    }

    //========================================
    // Trip / ODO
    //========================================

    Column {

        id: tripInfo

        anchors {

            bottom: parent.bottom
            bottomMargin: 18

            horizontalCenter: parent.horizontalCenter
        }

        spacing: 10

        Row {

            width: 170

            Text {

                text: "Trip A : "

                color: "#BFC4C9"

                font.pixelSize: 16
            }

            Item {
                width: 45
            }

            Text {

                text: "128.4 km"

                color: "white"

                font.pixelSize: 16
            }
        }

        Row {

            width: 170

            Text {

                text: "ODO : "

                color: "#BFC4C9"

                font.pixelSize: 16
            }

            Item {
                width: 58
            }

            Text {

                text: "18,254 km"

                color: "white"

                font.pixelSize: 16
            }
        }
    }
}