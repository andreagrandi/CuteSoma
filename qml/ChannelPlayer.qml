import QtQuick 1.0
import com.meego 1.0

Page
{
    id: channelPlayer
    tools: backMenuTool

    Row
    {
        spacing: 10
        anchors.verticalCenterOffset: 5
        anchors.left: parent.left

        Image
        {
            id: radioImage
            source: channelImage
            width: 200
            height: 200
            anchors.left: parent.left
        }

        Column
        {
            Label
            {
                text: channelName;
                font.pixelSize: 34;
                font.weight: Font.Bold;
            }

            Label
            {
                text: channelDescription;
                font.pixelSize: 30;
                font.weight: Font.Light;
                width: channelPlayer.width - radioImage.width;
                wrapMode: "WordWrap";
            }

            Label
            {
                text: song;
                font.pixelSize: 25;
                font.weight: Font.Bold;
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
