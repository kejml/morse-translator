import QtQuick 1.1
import com.nokia.meego 1.0

Item {
    id: categoryHeading
    property alias title: catLabel.text

    width: parent.width
    height: catLabel.height

    Rectangle {
        anchors.left: catLabel.right
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        height: 2
        color: "grey";
    }

    Label {
        id: catLabel
        anchors.left: parent.left
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        color: "grey";
    }
}
