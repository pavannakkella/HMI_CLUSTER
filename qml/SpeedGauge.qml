import QtQuick
import QtQuick.Shapes

Item {
    id: root

    implicitWidth: 550
    implicitHeight: 460

    property url iconUrl: Qt.resolvedUrl("assets/icons/GaugeBg.png")

    // Speed Properties
    property real speed: 0
    property real maxSpeed: 60

    // Animated UI Value
    property real displayedSpeed: 0

    //----------------------------------------------------
    // Animate Speed
    //----------------------------------------------------

    Behavior on displayedSpeed {
        NumberAnimation {
            duration: 600
            easing.type: Easing.OutCubic
        }
    }

    onSpeedChanged: {
        displayedSpeed = speed
    }

    //----------------------------------------------------
    // Gauge Background
    //----------------------------------------------------

    Image {
        id: gaugeBg

        anchors.fill: parent

        fillMode: Image.PreserveAspectFit

        source: root.iconUrl
    }

    //----------------------------------------------------
    // Background Arc
    //----------------------------------------------------

    Shape {
        id: arcBackground

        anchors.fill: parent

        ShapePath {

            strokeWidth: 18
            strokeColor: "#3C4047"

            fillColor: "transparent"

            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.RoundJoin

            PathAngleArc {

                centerX: root.width / 2
                centerY: root.height * 0.6

                radiusX: 170
                radiusY: 170

                startAngle: 160
                sweepAngle: 220
            }
        }
    }

    //----------------------------------------------------
    // Progress Arc
    //----------------------------------------------------

    Shape {
        id: arcProgress

        visible: root.displayedSpeed > 0

        anchors.fill: parent

        ShapePath {

            strokeWidth: 18
            strokeColor: "#00C853"

            fillColor: "transparent"

            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.RoundJoin

            PathAngleArc {

                centerX: root.width / 2
                centerY: root.height * 0.6

                radiusX: 170
                radiusY: 170

                startAngle: 160

                sweepAngle: 220 * root.displayedSpeed / root.maxSpeed
            }
        }
    }

    //----------------------------------------------------
    // Speed
    //----------------------------------------------------

    Text {
        id: speedText

        anchors.centerIn: parent

        text: Math.round(root.displayedSpeed)

        color: "white"

        font.pixelSize: 64
        font.bold: true
    }

    //----------------------------------------------------
    // Unit
    //----------------------------------------------------

    Text {

        anchors {
            top: speedText.bottom
            horizontalCenter: speedText.horizontalCenter
        }

        text: "km/h"

        color: "#909090"

        font.pixelSize: 20
    }

    //----------------------------------------------------
    // Temporary Test
    //----------------------------------------------------

    Timer {

        running: true
        repeat: true

        interval: 2000

        onTriggered: {

            root.speed = Math.random() * root.maxSpeed

            console.log(root.speed)
        }
    }
}