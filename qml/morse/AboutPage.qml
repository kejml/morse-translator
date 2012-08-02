// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: about
    anchors.fill: parent

    tools {
        ToolBarLayout {
            ToolIcon {
                platformIconId: "toolbar-back"
                onClicked: appWindow.pageStack.pop();
            }
        }
    }

    Column {
        id: aboutColumn
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: childrenRect.height
        width: parent.width
        Label {
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Morse Translator")
            font.pixelSize: 32
        }
        Label {
            id: subtitle
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Version:")+" 1.2.0"
            font.pixelSize: 24
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Author: Kejml")
            font.pixelSize: 24
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "<a style=\"color: "+(theme.inverted ? "white" : "black" )+"\" href=\"http://morse.kejml.eu\">http://morse.kejml.eu</a>"
            onLinkActivated: Qt.openUrlExternally(link)
            font.pixelSize: 24
        }
    }
}
