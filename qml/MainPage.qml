import QtQuick 1.0
import com.meego 1.0

Page {
    id: mainPage
    tools: commonTools

    property string currentChannel: ""

    ChannelsDelegate { id: delegate }
    ChannelsModel { id: model }

    ListView
    {
         id: channelsView;
         model: model;
         delegate: delegate;
         width: parent.width; height: parent.height; x: 0; cacheBuffer: 100;
    }
}
