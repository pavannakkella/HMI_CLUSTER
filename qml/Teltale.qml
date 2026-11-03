import QtQuick

Item
{
    property url icon_url
    implicitWidth: 36
    implicitHeight: 36

    Image {
        anchors.fill: parent
        sourceSize.width: width
        sourceSize.height: height
        fillMode: Image.PreserveAspectFit
        source: icon_url
    }


}
