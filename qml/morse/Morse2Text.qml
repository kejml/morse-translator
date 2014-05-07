/***************************************************************************

    Copyright (C) 2012-%YEAR%, Kejml <kejml@kejml.eu>
    All Rights Reserved.

    This file is part of Morse Translator.

    Morse Translator is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Morse Translator is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Morse Translator. If not, see <http://www.gnu.org/licenses/>.

 ***************************************************************************/

import QtQuick 1.1
import com.nokia.meego 1.0
import "UIconstants.js" as UI
import "Translator.js" as Translator

Page {
    id: morse2Text
    anchors.fill: parent;

    onStatusChanged: {
        if (status == PageStatus.Activating) {
            input.text+=" ";
            input.text=input.text.trim()
        }
    }

    Header {
        id: header
        title: qsTr("Morse2Text")
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

            ButtonRow {
                id: clipboardButtons
                anchors.margins: UI.SMALL_MARGIN
                width: parent.width
                exclusive: false
                Button {
                    id: copyButton
                    text: qsTr("Copy")
                    onClicked: {
                        input.selectAll();
                        input.copy();
                        input.select(0,0);
                    }
                }
                Button {
                    id: pasteButton
                    text: qsTr("Paste")
                    onClicked: {
                        input.readOnly = false;
                        input.paste();
                        input.readOnly = true;
                    }
                }
                Button {
                    id: deleteButton
                    text: qsTr("Delete")
                    onClicked: {
                        input.text = ""
                    }
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
                title: qsTr("Swap symbols")
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
                text: qsTr("All swap variants");
                onClicked: appWindow.pageStack.push(Qt.resolvedUrl("AllVariants.qml"),{inputText:input.text, outputText:Translator.morse2allTexts(input.text)})
                    //allDialog.open();
            }


        }
    }
    ScrollDecorator {
        flickableItem: flick
    }
}
