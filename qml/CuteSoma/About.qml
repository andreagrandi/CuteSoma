import QtQuick 1.0
import com.nokia.symbian 1.1

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
            source: "qrc:/CuteSoma_500x500.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label
        {
            text: "CuteSoma 1.0.0"
            font.pixelSize: 48
            font.weight: Font.Bold;
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label
        {
            text: "Soma.fm client for BlackBerry 10"
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
            ToolButton { iconSource: "toolbar-back"; onClicked: { pageStack.pop(); } }
    }
}
