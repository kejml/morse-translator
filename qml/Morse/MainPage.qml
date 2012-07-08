import QtQuick 1.1
import com.nokia.meego 1.0
import "UIconstants.js" as UI
import "Translator.js" as Translator

Page {
    tools: commonTools2

    ToolBarLayout {
        id: commonTools2
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

        /*onCurrentTabChanged: {
            console.log("Tab cahnge");
        }*/

        Text2Morse {
            id: tabText2Morse
        }
        Morse2Text {
            id: tabMorse2Text
        }
    }

}
