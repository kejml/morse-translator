import QtQuick 1.1
import com.nokia.meego 1.0
import "UIconstants.js" as UI
import "Translator.js" as Translator

Page {
    anchors.fill: parent;

    Header {
        id: header
        title: qsTr("Morse2Text")
        anchors.top: parent.top;
    }

    Rectangle {
        id: wrapper
        width: parent.width;
        color: "transparent"
        anchors.top: header.bottom;
        anchors.bottom: parent.bottom
        anchors.margins: UI.SMALL_MARGIN

        ButtonRow {
            id: buttons
            anchors.top: parent.top
            anchors.margins: UI.SMALL_MARGIN
            exclusive: false
            Button {
                id: dot
                text: "."
                onClicked: {
                    input.text += "."
                }
            }
            Button {
                id: dash
                text: "-"
                onClicked: {
                    input.text += "-"
                }
            }
            Button {
                id: pipe
                text: "|"
                onClicked: {
                    input.text += "|"
                }
            }
        }


        Label {
            id: input
            anchors.top: buttons.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            onTextChanged: {
                output.text = Translator.morse2text(text);
            }
        }

        Label {
            id: output
            anchors.top: input.bottom
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
    }
}
