import QtQuick 1.0
import com.meego 1.0

Rectangle
{
    width: 480
    height: 100
    color: "#f0f1f2"
    id: channels

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
        width:80
        height: 80
    }

    Item
    {
        width: 10
        height: 100
    }

    Column
    {
        height: 95
        width: 400
        anchors.top: parent.top
        anchors.topMargin: 15

        Label
        {
            text: channelName;
            font.pixelSize: 26;
            font.weight: Font.Bold;
        }

        Label
        {
            text: channelDescription;
            font.pixelSize: 22;
            font.weight: Font.Light;
        }

        Label
        {
            text: song;
            font.pixelSize: 22;
            font.weight: Font.Bold;
        }
    }

    Rectangle
    {
            anchors.bottom: parent.bottom
            height: 1
            color: "#e4e5e7"
            width: root.width
    }
}
