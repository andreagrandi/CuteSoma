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
}
