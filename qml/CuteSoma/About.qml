import QtQuick 1.0
import com.nokia.meego 1.0

Page
{
    id: aboutPage
    tools: backMenuTool

    Column
    {
        spacing: 10
        anchors.verticalCenterOffset: 3
        anchors.centerIn: parent

        Image
        {
            source: "qrc:/CuteSoma_180x180.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label
        {
            text: "CuteSoma 0.2.1"
            font.pixelSize: 38
            font.weight: Font.Bold;
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label
        {
            text: "Soma.fm client for MeeGo"
            font.pixelSize: 34
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label
        {
            text: "Released under the GPL, version 3.0 or later."
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label
        {
            text: "Andrea Grandi <a.grandi@gmail.com>"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label
        {
            text: "Cornelius Hald <hald@icandy.de>"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    ToolBarLayout
    {
            id: backMenuTool
            visible: true
            ToolIcon { iconId: "toolbar-back"; onClicked: { pageStack.pop(); } }
    }
}
