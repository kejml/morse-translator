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
    tools: commonTools

    ToolBarLayout {
        id: commonTools
        visible: true
        ButtonRow {
            style: TabButtonStyle { }
            TabButton {
                text: qsTr("Text2Morse")
                tab: tabText2Morse
            }
            TabButton {
                text: qsTr("Morse2Text")
                tab: tabMorse2Text
            }
        }
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    TabGroup {
        id: tabGroup
        currentTab: tabText2Morse

        Text2Morse {
            id: tabText2Morse
        }
        Morse2Text {
            id: tabMorse2Text
        }
    }

}
