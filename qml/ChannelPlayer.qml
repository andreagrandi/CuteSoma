import QtQuick 1.0
import com.meego 1.0

Page
{
    id: channelPlayer
    tools: backMenuTool

    Item
    {
        anchors.verticalCenterOffset: 5
        anchors.left: parent.left

        Image
        {
            id: radioImage
            source: channelImage
            width: 300
            height: 300
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

        Item
        {
            anchors.left: radioImage.right
            anchors.leftMargin: 10

            Label
            {
                id: nameLabel
                text: channelName;
                font.pixelSize: 34;
                font.weight: Font.Bold;
            }

            Label
            {
                id: djLabel
                text: "Dj: " + channelDj;
                font.pixelSize: 25;
                font.weight: Font.Light;
                anchors.top: nameLabel.bottom
                anchors.topMargin: 10
            }

            Label
            {
                id: descriptionLabel
                text: channelDescription;
                font.pixelSize: 30;
                font.weight: Font.Light;
                width: channelPlayer.width - radioImage.width;
                wrapMode: "WordWrap";
                anchors.top: djLabel.bottom
                anchors.topMargin: 10
            }

            Label
            {
                id: listenersLabel
                text: "Listeners: " + channelListeners;
                font.pixelSize: 25;
                font.weight: Font.Light;
                anchors.top: descriptionLabel.bottom
                anchors.topMargin: 10
            }

            Label
            {
                id: songLabel
                text: song;
                font.pixelSize: 25;
                font.weight: Font.Bold;
                anchors.top: listenersLabel.bottom
                anchors.topMargin: 10
            }
        }
    }

    ToolBarLayout
    {
            id: backMenuTool
            visible: true
            ToolIcon { iconId: "toolbar-back"; onClicked: { pageStack.pop(); } }
    }
}
