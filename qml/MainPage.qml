import QtQuick 1.1
import com.meego 1.0

Page {
    id: mainPage
    tools: commonTools

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
