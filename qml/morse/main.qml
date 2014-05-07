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
import "storage.js" as Storage

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    Component.onCompleted: {
        Storage.initialize();
    }

    MainPage {
        id: mainPage
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                text: qsTr("Settings")
                onClicked: appWindow.pageStack.push(Qt.resolvedUrl("SettingsPage.qml"))
            }
            MenuItem {
                text: qsTr("About")
                onClicked: appWindow.pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }
    }
    Menu {
        id: settingsMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                text: qsTr("About")
                onClicked: appWindow.pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }
    }
}
