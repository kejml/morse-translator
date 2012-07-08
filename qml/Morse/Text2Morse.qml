import QtQuick 1.1
import com.nokia.meego 1.0
import "UIconstants.js" as UI
import "Translator.js" as Translator

Page {
    anchors.fill: parent;

    Header {
        id: header
        title: qsTr("Text2Morse")
        anchors.top: parent.top;
    }

    Rectangle {
        id: wrapper
        width: parent.width;
        color: "transparent"
        anchors.top: header.bottom;
        anchors.bottom: parent.bottom
        anchors.margins: UI.SMALL_MARGIN

        TextField {
            id: input
            placeholderText: qsTr("Text to translate")
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            onTextChanged: {
                output.text = Translator.text2morse(text);
            }
        }

        Label {
            id: output
            anchors.top: input.bottom
            width: parent.width
            wrapMode: Text.WrapAnywhere
        }
    }
}
