import QtQuick

Item {
    id: root

    width: 80
    height: 420

    //=========================
    // Properties
    //=========================

    property real value: 60
    property real warningLevel: 80

    property real minimum: 0
    property real maximum: 100

    property string unit: "%"
    property string title: ""

    property color normalColor: "#00C853"
    property color warningColor: "#D50000"

    property url iconSource: ""
    property int iconSize: 34

    property bool mirror: false

    readonly property color currentColor:
        value <= warningLevel ? normalColor : warningColor

    //=========================
    // Layout
    //=========================

    Column {
        anchors {
            fill: parent
            margins: 4
        }

        spacing: 14

        //=====================
        // Icon
        //=====================

        Image {
            width: root.iconSize
            height: root.iconSize

            anchors.horizontalCenter: parent.horizontalCenter

            source: root.iconSource
            fillMode: Image.PreserveAspectFit
        }

        //=====================
        // Gauge
        //=====================

        Rectangle {
            id: track

            width: 28
            height: 280

            anchors.horizontalCenter: parent.horizontalCenter

            radius: width / 2

            color: "#1D1F22"

            border.width: 2
            border.color: "#4A4D52"

            clip: true

            Rectangle {

                width: parent.width
                height: parent.height * root.value / root.maximum

                anchors.bottom: parent.bottom

                radius: parent.radius

                color: root.currentColor

                Behavior on height {
                    NumberAnimation {
                        duration: 700
                        easing.type: Easing.InOutQuad
                    }
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 250
                    }
                }
            }
        }

        //=====================
        // Value Box
        //=====================

        Rectangle {

            width: 60
            height: 34

            anchors.horizontalCenter: parent.horizontalCenter

            radius: 6

            color: "transparent"

            border.width: 2
            border.color: root.currentColor

            Text {

                anchors.centerIn: parent

                text: Math.round(root.value) + root.unit

                color: root.currentColor

                font.pixelSize: 18
                font.bold: true
            }
        }

        //=====================
        // Title
        //=====================

        Text {

            anchors.horizontalCenter: parent.horizontalCenter

            text: root.title

            color: "#C5C5C5"

            font.pixelSize: 14
            font.bold: true
        }
    }
}
