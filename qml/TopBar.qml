import QtQuick
import QtQuick.Shapes

Item {
    id: root

    implicitWidth: 1400
    implicitHeight: 180

    Shape {
        anchors.fill: parent

        ShapePath {

            strokeWidth: 2
            strokeColor: "#2C2F33"

            fillColor: "#17191C"

            startX: 0
            startY: 0

            // top
            PathLine {
                x: root.width
                y: 0
            }

            // top-right transition
            PathLine {
                x: root.width * 0.95
                y: root.height * 0.82
            }

            // rounded bottom-right
            PathArc {
                x: root.width * 0.88
                y: root.height

                radiusX: 70
                radiusY: 70
            }

            // bottom
            PathLine {
                x: root.width * 0.12
                y: root.height
            }

            // rounded bottom-left
            PathArc {
                x: root.width * 0.05
                y: root.height * 0.82

                radiusX: 70
                radiusY: 70
            }

            // close
            PathLine {
                x: 0
                y: 0
            }
        }
    }
}
