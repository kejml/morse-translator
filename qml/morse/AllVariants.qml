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
