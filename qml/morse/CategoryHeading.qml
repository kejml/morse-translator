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

Item {
    id: categoryHeading
    property alias title: catLabel.text

    width: parent.width
    height: catLabel.height

    Rectangle {
        anchors.left: catLabel.right
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        height: 2
        color: "grey";
    }

    Label {
        id: catLabel
        anchors.left: parent.left
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        color: "grey";
    }
}
