import QtQuick 1.0
import com.nokia.symbian 1.1

Component
{
    id: channelDelegate

    Rectangle
    {
        width: mainPage.width
        height: 200
        color: "black"
        id: channels

        /*BorderImage
        {
            id: background
            anchors.fill: parent
            visible: mouseArea.pressed
            source: privateStyle.imagePath("list-background-pressed-center")
        }*/

        Image
        {
            id: thumb
            source: channelImage
            sourceSize.height: 180
            sourceSize.width: 180
            asynchronous: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 0
            width: 180
            height: 180
        }

        Image
        {
            id: arrow
            source: privateStyle.imagePath("qtg_graf_drill_down_indicator")
            width: 60
            height: 60
            anchors.right: parent.right
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
            anchors.leftMargin: 20
            spacing: 4

            Label
            {
                text: channelName;
                font.pixelSize: 44;
                font.weight: Font.Bold;
                maximumLineCount: 1
                elide: Text.ElideRight
                anchors.left: parent.left
                anchors.right: parent.right
            }

            Label
            {
                text: channelDescription;
                font.pixelSize: 32;
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
                font.pixelSize: 32;
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
                channelPlayer.model = model
                pageStack.push(channelPlayer)
            }
        }
    }
}
