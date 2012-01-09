import QtQuick 1.0
import com.nokia.meego 1.0

Page {
    id: mainPage
    tools: commonTools

    property string currentChannel: ""

    Image
    {
        id: header
        height: 72
        source: "image://theme/color13-meegotouch-view-header-fixed"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right

        Text
        {
            text: "CuteSoma"
            color: "white"
            font.family: "Nokia Pure Text"
            font.pixelSize: 32
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    ListView
    {
         id: channelsView
         model: ChannelsModel {}
         delegate: ChannelsDelegate {}
         clip: true
         anchors.top: header.bottom
         anchors.left: parent.left
         anchors.right: parent.right
         anchors.bottom: parent.bottom
    }


}
