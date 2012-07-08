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
        z: 2
    }

    Flickable {
        width:parent.width
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        contentHeight: wrapper.height
        z: 1
        anchors.margins: UI.SMALL_MARGIN

        Column {
            id: wrapper
            anchors.margins: UI.SMALL_MARGIN
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            spacing: UI.SMALL_MARGIN

            CategoryHeading {
                title: qsTr("Morse Code")
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
                Button {
                    id: backspace
                    iconSource: "image://theme/icon-m-toolbar-backspace"
                    onClicked: {
                        input.text = input.text.slice(0,-1);
                    }
                    /*MouseArea {
                        anchors.fill: parent
                        onPressAndHold: input.text = "";
                        onClicked: parent.clicked()
                        onPressed: parent.checked=true
                        onReleased: parent.checked=false
                    }*/
                }
            }

            TextArea {
                id: input
                width: parent.width
                readOnly: true
                onTextChanged: {
                    output.text = Translator.morse2text(text);
                }
            }

            CategoryHeading {
                title: qsTr("Text")
            }

            TextArea {
                id: output
                width: parent.width
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                readOnly: true
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
                    text: ". \u2194 -"
                    onClicked: {
                        var tmp = input.text.replace(/\./g,"*");
                        tmp = tmp.replace(/\-/g,".");
                        input.text = tmp.replace(/\*/g,"-");
                    }
                }
                Button {
                    id: dotpipe
                    text: ". \u2194 |"
                    onClicked: {
                        var tmp = input.text.replace(/\./g,"*");
                        tmp = tmp.replace(/\|/g,".");
                        input.text = tmp.replace(/\*/g,"|");
                    }
                }
                Button {
                    id: dashpipe
                    text: "- \u2194 |"
                    onClicked: {
                        var tmp = input.text.replace(/\-/g,"*");
                        tmp = tmp.replace(/\|/g,"-");
                        input.text = tmp.replace(/\*/g,"|");                }
                }
            }
            Button {
                id: allReplace
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("All replacement variants");
                onClicked: appWindow.pageStack.push(Qt.resolvedUrl("AllVariants.qml"),{inputText:input.text, outputText:Translator.morse2allTexts(input.text)})
                    //allDialog.open();
            }


        }
    }
}
