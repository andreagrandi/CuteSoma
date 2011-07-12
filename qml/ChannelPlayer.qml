import QtQuick 1.0
import com.meego 1.0

Page
{
    id: channelPlayer
    tools: backMenuTool

    Item
    {
        id: channelLandscapeLayout
        visible: true
        anchors.left: parent.left

        Item
        {
            id: songItemL
            anchors.top: parent.bottom
            anchors.topMargin: 10

            Image
            {
                id: radioImageL
                source: channelImage
                width: 310
                height: 310
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Item
            {
                anchors.left: radioImageL.right
                anchors.leftMargin: 10

                Label
                {
                    id: nameLabelL
                    text: channelName;
                    font.pixelSize: 34;
                    font.weight: Font.Bold;
                }

                Label
                {
                    id: djLabelL
                    text: "Dj: " + channelDj;
                    font.pixelSize: 25;
                    font.weight: Font.Light;
                    anchors.top: nameLabelL.bottom
                    anchors.topMargin: 10
                }

                Label
                {
                    id: descriptionLabelL
                    text: channelDescription;
                    font.pixelSize: 30;
                    font.weight: Font.Light;
                    width: channelPlayer.width - radioImageL.width - 20;
                    wrapMode: "WordWrap";
                    anchors.top: djLabelL.bottom
                    anchors.topMargin: 10
                }

                Label
                {
                    id: listenersLabelL
                    text: "Listeners: " + channelListeners;
                    font.pixelSize: 25;
                    font.weight: Font.Light;
                    anchors.top: descriptionLabelL.bottom
                    anchors.topMargin: 10
                }

                Label
                {
                    id: songLabelL
                    text: song;
                    font.pixelSize: 25;
                    font.weight: Font.Bold;
                    anchors.top: listenersLabelL.bottom
                    anchors.topMargin: 10
                }
            }
        }

        Item
        {
            id: controlRowL
            anchors.top: parent.top
            anchors.topMargin: radioImageL.height + 20
            anchors.left: parent.left
            anchors.leftMargin: 10

            Button
            {
                id: playStopButtonL

                Image
                {
                    id: imgPlayL
                    anchors.centerIn: parent
                    visible: false
                    source: "image://theme/icon-m-toolbar-mediacontrol-play" + (theme.inverted ? "-inverse" : "")
                }

                Image
                {
                    id: imgPauseL
                    anchors.centerIn: parent
                    source: "image://theme/icon-m-toolbar-mediacontrol-pause" + (theme.inverted ? "-inverse" : "")
                }

                onClicked:
                {
                    if (imgPlayL.visible)
                    {
                        imgPlayP.visible = false;
                        imgPauseP.visible = true;
                        imgPlayL.visible = false;
                        imgPauseL.visible = true;

                        appWindow.play();
                    }
                    else
                    {
                        imgPlayP.visible = true;
                        imgPauseP.visible = false;
                        imgPlayL.visible = true;
                        imgPauseL.visible = false;

                        appWindow.pause();
                    }
                }
            }

            Label
            {
                id: counterLabelL
                text: "00:00"
                anchors.left: playStopButtonL.right
                anchors.leftMargin: playStopButtonL.width + 100
            }
        }
    }

    Item
    {
        id: channelPortraitLayout
        visible: false
        anchors.verticalCenterOffset: 5
        anchors.left: parent.left

        Item
        {
            id: songItemP
            anchors.top: parent.bottom
            anchors.topMargin: 10

            Image
            {
                id: radioImageP
                source: channelImage
                width: 400
                height: 400
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 40
            }

            Item
            {
                anchors.top: radioImageP.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 15

                Label
                {
                    id: nameLabelP
                    text: channelName;
                    font.pixelSize: 34;
                    font.weight: Font.Bold;
                }

                Label
                {
                    id: djLabelP
                    text: "Dj: " + channelDj;
                    font.pixelSize: 25;
                    font.weight: Font.Light;
                    anchors.top: nameLabelP.bottom
                    anchors.topMargin: 10
                }

                Label
                {
                    id: descriptionLabelP
                    text: channelDescription;
                    font.pixelSize: 25;
                    font.weight: Font.Light;
                    width: channelPlayer.width - 20
                    wrapMode: "WordWrap";
                    anchors.top: djLabelP.bottom
                    anchors.topMargin: 10
                }

                Label
                {
                    id: listenersLabelP
                    text: "Listeners: " + channelListeners;
                    font.pixelSize: 25;
                    font.weight: Font.Light;
                    anchors.top: descriptionLabelP.bottom
                    anchors.topMargin: 10
                }

                Label
                {
                    id: songLabelP
                    text: song;
                    font.pixelSize: 25;
                    font.weight: Font.Bold;
                    anchors.top: listenersLabelP.bottom
                    anchors.topMargin: 10
                    width: channelPlayer.width - 30
                    wrapMode: "WordWrap"
                }
            }
        }

        Item
        {
            id: controlRowP
            anchors.top: parent.top
            anchors.topMargin: 690
            anchors.left: parent.left
            anchors.leftMargin: 15

            Button
            {
                id: playStopButtonP

                Image
                {
                    id: imgPlayP
                    anchors.centerIn: parent
                    visible: false
                    source: "image://theme/icon-m-toolbar-mediacontrol-play" + (theme.inverted ? "-inverse" : "")
                }

                Image
                {
                    id: imgPauseP
                    anchors.centerIn: parent
                    source: "image://theme/icon-m-toolbar-mediacontrol-pause" + (theme.inverted ? "-inverse" : "")
                }

                onClicked:
                {
                    if (imgPlayP.visible)
                    {
                        imgPlayP.visible = false;
                        imgPauseP.visible = true;
                        imgPlayL.visible = false;
                        imgPauseL.visible = true;

                        appWindow.play();
                    }
                    else
                    {
                        imgPlayP.visible = true;
                        imgPauseP.visible = false;
                        imgPlayL.visible = true;
                        imgPauseL.visible = false;

                        appWindow.pause();
                    }
                }
            }

            Label
            {
                id: counterLabelP
                text: "00:00"
                anchors.left: playStopButtonP.right
                anchors.leftMargin: 50
                anchors.top: parent.top
                anchors.topMargin: 15
            }
        }

    }

    states: [
            State {
                name: "inLandscape"
                when: !appWindow.inPortrait
                PropertyChanges {
                    target: channelLandscapeLayout
                    visible: true
                }
                PropertyChanges {
                    target: channelPortraitLayout
                    visible: false
                }
            },
            State {
                name: "inPortrait"
                when: appWindow.inPortrait
                PropertyChanges {
                    target: channelLandscapeLayout
                    visible: false
                }
                PropertyChanges {
                    target: channelPortraitLayout
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
