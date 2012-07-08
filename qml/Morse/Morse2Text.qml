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

    Column {
        id: wrapper
        width: parent.width;
        anchors.top: header.bottom;
        anchors.bottom: parent.bottom
        anchors.margins: UI.SMALL_MARGIN
        spacing: UI.SMALL_MARGIN

        CategoryHeading {
            title: qsTr("Input")
        }

        ButtonRow {
            id: buttons
            anchors.margins: UI.SMALL_MARGIN
            width: parent.width
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
            width: parent.width
            onTextChanged: {
                output.text = Translator.morse2text(text);
            }
        }

        CategoryHeading {
            title: qsTr("Output")
        }

        Label {
            id: output
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        CategoryHeading {
            title: qsTr("Advanced")
        }

        ButtonRow {
            id: advButtons
            anchors.margins: UI.SMALL_MARGIN
            width: parent.width
            exclusive: false
            Button {
                id: dotdash
                text: ". <=> -"
                onClicked: {
                    var tmp = input.text.replace(/\./g,"*");
                    tmp = tmp.replace(/\-/g,".");
                    input.text = tmp.replace(/\*/g,"-");
                }
            }
            Button {
                id: dotpipe
                text: ". <=> |"
                onClicked: {
                    var tmp = input.text.replace(/\./g,"*");
                    tmp = tmp.replace(/\|/g,".");
                    input.text = tmp.replace(/\*/g,"|");
                }
            }
            Button {
                id: dashpipe
                text: "- <=> |"
                onClicked: {
                    var tmp = input.text.replace(/\-/g,"*");
                    tmp = tmp.replace(/\|/g,"-");
                    input.text = tmp.replace(/\*/g,"|");                }
            }
        }
        Button {
            id: allReplace
            text: qsTr("All replacemnet variants");
            onClicked: allDialog.open();
        }

        QueryDialog {
            id: allDialog
            title: qsTr("All replacemnet variants");
            message: Translator.morse2allTexts(input.text)
            acceptButtonText: qsTr("Ok");
        }

    }
}
