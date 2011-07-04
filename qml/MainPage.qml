import QtQuick 1.1
import com.meego 1.0

Page {
    id: mainPage
    tools: commonTools

    ChannelsDelegate { id: channelsDelegate }
    ChannelsModel { id: channelsModel }

    ListView
    {
         id: channelsView; model: channelsModel; delegate: channelsDelegate;
         width: parent.width; height: parent.height; x: 0; cacheBuffer: 100;
    }
}
