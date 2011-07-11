import QtQuick 1.0
import com.meego 1.0

Page
{
    id: channelPlayer
    tools: backMenuTool

    Item
    {
        id: channelHorizontalLayout
        visible: true
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

    Item
    {
        id: channelVerticalLayout
        visible: false
        anchors.verticalCenterOffset: 5
        anchors.left: parent.left

        Image
        {
            id: radioImageV
            source: channelImage
            width: 360
            height: 360
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

    }

    states: [
            State {
                name: "inLandscape"
                when: !appWindow.inPortrait
                PropertyChanges {
                    target: channelHorizontalLayout
                    visible: true
                }
                PropertyChanges {
                    target: channelVerticalLayout
                    visible: false
                }
            },
            State {
                name: "inPortrait"
                when: appWindow.inPortrait
                PropertyChanges {
                    target: channelHorizontalLayout
                    visible: false
                }
                PropertyChanges {
                    target: channelVerticalLayout
                    visible: true
                }
            }
        ]

    ToolBarLayout
    {
            id: backMenuTool
            visible: true
            ToolIcon { iconId: "toolbar-back"; onClicked: { pageStack.pop(); } }
    }
}
