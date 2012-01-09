import QtQuick 1.0
import com.nokia.meego 1.0

PageStackWindow
{
    id: appWindow
    initialPage: mainPage

    MainPage { id: mainPage }

    About { id: aboutPage }

    ChannelPlayer { id: channelPlayer }

    ToolBarLayout
    {
        id: commonTools
        visible: true

        ToolIcon
        {
            platformIconId: "toolbar-view-menu";
            anchors.right: parent===undefined ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }

        BusyIndicator
        {
            id: channelLoadingIndicator
            platformStyle: BusyIndicatorStyle { size: "small" }
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
            MenuItem
            {
                text: "Quit"
                onClicked: Qt.quit()
            }
        }
    }
}
