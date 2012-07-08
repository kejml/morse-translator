import QtQuick 1.1
import com.nokia.meego 1.0
import "UIconstants.js" as UI
import "Translator.js" as Translator

Page {
    anchors.fill: parent;

    property alias inputText: input.text
    property alias outputText: output.text

    tools {
        ToolBarLayout {
            ToolIcon {
                platformIconId: "toolbar-back"
                onClicked: appWindow.pageStack.pop();
            }
            ToolIcon {
                platformIconId: "toolbar-view-menu"
                onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
            }
        }
    }

    Header {
        id: header
        title: qsTr("All swap variants")
        anchors.top: parent.top;
        z: 2
    }

    Flickable {
        id: flick
        width:parent.width
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        contentHeight: wrapper.height
        z: 1
        anchors.margins: UI.SMALL_MARGIN
        Column {
            id: wrapper
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: UI.SMALL_MARGIN

            spacing: UI.SMALL_MARGIN

            CategoryHeading {
                title: qsTr("Input")
            }

            TextArea {
                id: input
                width: parent.width
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                readOnly: true
            }

            CategoryHeading {
                title: qsTr("Outputs")
            }

            TextArea {
                id: output
                width: parent.width
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                readOnly: true
            }
        }
    }
    ScrollDecorator {
        flickableItem: flick
    }
}
