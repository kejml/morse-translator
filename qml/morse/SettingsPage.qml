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
import "storage.js" as Storage
import "UIconstants.js" as UI

Page{
    id: bookPage
    anchors.fill: parent

    tools:     ToolBarLayout {
        id: settingsTools
        ToolIcon {
            platformIconId: "toolbar-back"
            onClicked: pageStack.pop()
        }
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (settingsMenu.status == DialogStatus.Closed) ? settingsMenu.open() : myMenu.close()
        }
    }
    Flickable {
        anchors.top: header.bottom
        anchors.topMargin: UI.SMALL_MARGIN
        anchors.bottom: parent.bottom
        width: parent.width
        contentHeight: settingsColumn.height

        Column {
            id: settingsColumn
            width: parent.width
            spacing: UI.LARGE_MARGIN

            /*CategoryHeading {
                title: "Vzhled"
            }
*/
            Item {
                id: useCyrillic
                anchors.margins: UI.SMALL_MARGIN
                width: parent.width
                height: cyrillicLabel.height

                Label {
                    id: cyrillicLabel
                    anchors.left: parent.left
                    anchors.margins: UI.SMALL_MARGIN
                    text: qsTr("Translate Morse to Cyrillic")
                }

                CheckBox {
                    id: cyrillicCheckbox
                    anchors.right: parent.right
                    anchors.margins: UI.SMALL_MARGIN
                    onCheckedChanged: {
                        Storage.setSetting("cyrillic", cyrillicCheckbox.checked)
                    }
                    checked: ( Storage.getSetting("cyrillic") )
                }
            }

        }

    }

    Header {
        id: header
        title: qsTr("Settings")
    }
}
