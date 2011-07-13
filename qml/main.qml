import QtQuick 1.0
import com.meego 1.0

PageStackWindow
{
    id: appWindow
    initialPage: mainPage
    MainPage { id: mainPage }

    signal play()
    signal pause()
    signal loadChannel(string channel)

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
