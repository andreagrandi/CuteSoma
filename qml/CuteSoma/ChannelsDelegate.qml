import QtQuick 1.0
import com.nokia.meego 1.0

Component
{
    id: channelDelegate

    Rectangle
    {
        width: mainPage.width
        height: 100
        color: "#f0f1f2"
        id: channels

        BorderImage
        {
            id: background
            anchors.fill: parent
            visible: mouseArea.pressed
            source: "image://theme/meegotouch-list-background-pressed-center"
        }

        Image
        {
            id: thumb
            source: channelImage
            sourceSize.height: 90
            sourceSize.width: 90
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            width:90
            height: 90
        }

        Image
        {
            id: arrow
            source: "image://theme/icon-m-common-drilldown-arrow" + (theme.inverted ? "-inverse" : "")
            anchors.right: parent.right;
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter
        }

        Column
        {
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: arrow.left
            anchors.rightMargin: 10
            anchors.left: thumb.right
            anchors.leftMargin: 10
            spacing: 2

            Label
            {
                text: channelName;
                font.pixelSize: 22;
                font.weight: Font.Bold;
                maximumLineCount: 1
                elide: Text.ElideRight
                anchors.left: parent.left
                anchors.right: parent.right
            }

            Label
            {
                text: channelDescription;
                font.pixelSize: 16;
                font.weight: Font.Light;
                maximumLineCount: 2
                elide: Text.ElideRight
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors.left: parent.left
                anchors.right: parent.right
            }

            Label
            {
                text: song;
                font.pixelSize: 16;
                font.weight: Font.Bold;
                maximumLineCount: 1
                elide: Text.ElideRight
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors.left: parent.left
                anchors.right: parent.right
            }
        }

        Rectangle
        {
            anchors.bottom: parent.bottom
            height: 1
            color: "#e4e5e7"
            anchors.left: parent.left
            anchors.right: parent.right
        }

        ChannelPlayer {id: channelPlayer }

        MouseArea
        {
            id: mouseArea
            anchors.fill: parent

            onClicked:
            {
                console.debug(channelName + " clicked");
                console.debug(songUrlFast);

                if (mainPage.currentChannel != channelName)
                {
                    serverComm.loadChannel(songUrlFast)
                }

                mainPage.currentChannel = channelName;
                pageStack.push(channelPlayer)
            }
        }
    }
}
