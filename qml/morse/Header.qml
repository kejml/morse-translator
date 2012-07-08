// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0
import "UIconstants.js" as UI

Item {
    id: header
    property alias title: titleText.text
    anchors.top: parent.top
    width: parent.width
    height: 70;

    Rectangle {
        id: headerRect;
        anchors.fill: parent

        color: UI.MAIN_COLOR
        Text {
            id: titleText
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: UI.HEADER_MARGIN
            anchors.right: parent.right
            anchors.rightMargin: UI.HEADER_MARGIN
            font.pixelSize: 32
            font.weight: Font.Light
            color: UI.HEADER_TEXT_COLOR
            elide: Text.ElideRight
        }
    }
}
