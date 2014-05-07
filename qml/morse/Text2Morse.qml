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
        }
    }
    ScrollDecorator {
        flickableItem: flick
    }
}
