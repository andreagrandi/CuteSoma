import QtQuick 1.0

XmlListModel
{
    id: xmlModel
    source: "http://somafm.com/channels.xml"
    query: "/channels/channel"

    XmlRole { name: "channelImage"; query: "image/string()" }
    XmlRole { name: "channelName"; query: "title/string()" }
    XmlRole { name: "channelDescription"; query: "description/string()" }
    XmlRole { name: "song"; query: "lastPlaying[1]/string()" }
    XmlRole { name: "channelDj"; query: "dj/string()" }
    XmlRole { name: "channelListeners"; query: "listeners/string()" }
    XmlRole { name: "songUrlFast"; query: "fastpls[1]/string()" }

    onStatusChanged:
    {
        if(status == XmlListModel.Ready)
        {
            channelLoadingIndicator.visible = false;
        }
        else if(status == XmlListModel.Error)
        {
            channelLoadingIndicator.visible = false;
        }
        else if(status == XmlListModel.Loading)
        {
            channelLoadingIndicator.visible = true;
        }
    }
}
