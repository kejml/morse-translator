import QtQuick 1.1
import com.nokia.meego 1.0
import Torch 1.0
import "UIconstants.js" as UI
import "Translator.js" as Translator

Page {
    anchors.fill: parent;

    Header {
        id: header
        title: qsTr("Text2Morse")
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
                title: qsTr("Text")
            }

            TextArea {
                id: input
                placeholderText: qsTr("Text to translate")
                anchors.left: parent.left
                anchors.right: parent.right
                inputMethodHints: Qt.ImhNoPredictiveText
                onTextChanged: {
                    output.text = Translator.text2morse(text);
                }
            }

            CategoryHeading {
                title: qsTr("Morse Code")
            }

            TextArea {
                id: output
                width: parent.width
                wrapMode: Text.WrapAnywhere
                readOnly: true
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                id: copy
                text: qsTr("Copy to clipboard")
                onClicked: {
                    output.selectAll();
                    output.copy();
                    output.select(0,0);
                }
            }

            CategoryHeading {
                title: qsTr("Send message")
            }
            ButtonRow {
                id: sendButtons
                exclusive: false

                Button {
                    id: ledButton
                    text: qsTr("LED")
                }
                Button {
                    id: beepButton
                    text: qsTr("Beep")
                }

            }
        }
    }
    ScrollDecorator {
        flickableItem: flick
    }
    Torch {
        id: mTorch
        //onStatusChanged: mButton.text = on ? "Switch OFF" : "Switch ON";
    }
}
