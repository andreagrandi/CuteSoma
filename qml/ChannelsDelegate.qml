import QtQuick 1.0
import com.meego 1.0

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

        Item
        {
            width: 10
            height: 100
        }

        Image
        {
            id: thumb
            source: channelImage
            anchors.verticalCenter: parent.verticalCenter
            width:90
            height: 90
        }

        Item
        {
            width: 15
            height: 100
        }

        Column
        {
            height: 98
            width: parent.width - 95
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 5
            anchors.leftMargin: 85

            Label
            {
                text: channelName;
                font.pixelSize: 24;
                font.weight: Font.Bold;
            }

            Label
            {
                text: channelDescription;
                font.pixelSize: 20;
                font.weight: Font.Light;
            }

            Label
            {
                text: song;
                font.pixelSize: 18;
                font.weight: Font.Bold;
            }

            Image
            {
                source: "image://theme/icon-m-common-drilldown-arrow" + (theme.inverted ? "-inverse" : "")
                anchors.right: parent.right;
                anchors.verticalCenter: parent.verticalCenter //FIXME: how to center eliminating the warning at runtime?
            }
        }

        Rectangle
        {
            anchors.bottom: parent.bottom
            height: 1
            color: "#e4e5e7"
            width: channels.width
        }

        ChannelPlayer {id: channelPlayer }

        MouseArea
        {
            id: mouseArea
            anchors.fill: parent
            onClicked: { console.debug(channelName + " clicked");
                pageStack.push(channelPlayer)}
        }
    }
}
