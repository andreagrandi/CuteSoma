import QtQuick 1.0
import com.nokia.symbian 1.1

PageStackWindow
{
    id: appWindow
    initialPage: mainPage
    showStatusBar: false

    MainPage { id: mainPage }

    About { id: aboutPage }

    ChannelPlayer { id: channelPlayer }

    ToolBarLayout
    {
        id: commonTools
        visible: true

        ToolButton
        {
            iconSource: "toolbar-view-menu";
            anchors.right: parent===undefined ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }

        BusyIndicator
        {
            id: channelLoadingIndicator
            running: true
            visible: false
            anchors.centerIn: parent
        }
    }

    Menu
    {
        id: myMenu
        visualParent: pageStack

        MenuLayout
        {
            MenuItem
            {
                text: "About"
                onClicked: { pageStack.push(aboutPage); }
            }
        }
    }
}
