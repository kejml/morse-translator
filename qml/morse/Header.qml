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
import "UIconstants.js" as UI

Item {
    id: header
    property alias title: titleText.text
    anchors.top: parent.top
    width: parent.width
    height: 70;

    Rectangle {
        id: headerRect;
        anchors.fill: parent

        color: UI.MAIN_COLOR
        Text {
            id: titleText
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: UI.HEADER_MARGIN
            anchors.right: parent.right
            anchors.rightMargin: UI.HEADER_MARGIN
            font.pixelSize: 32
            font.weight: Font.Light
            color: UI.HEADER_TEXT_COLOR
            elide: Text.ElideRight
        }
    }
}
