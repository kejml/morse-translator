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
