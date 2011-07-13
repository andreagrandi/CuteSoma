#include "servercomm.h"
#include "playlistreader.h"
#include <QDebug>
#include <QUrl>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QMediaPlaylist>

ServerComm::ServerComm(QObject *parent) :
    QObject(parent)
{
    playlistNetworkReader = new QNetworkAccessManager(this);
    connect(playlistNetworkReader, SIGNAL(finished(QNetworkReply*)), this, SLOT(finishLoadingChannel(QNetworkReply*)));

    player = new QMediaPlayer(this);
    mediaplaylist = new QMediaPlaylist;
    player->setPlaylist(mediaplaylist);

    connect(player, SIGNAL(mediaStatusChanged(QMediaPlayer::MediaStatus)), this, SLOT(setMediaStatus(QMediaPlayer::MediaStatus)));
    connect(player, SIGNAL(positionChanged(qint64)), this, SLOT(updateProgress(qint64)));
}

void ServerComm::play()
{
    player->play();
}

void ServerComm::pause()
{
    player->pause();
}

void ServerComm::loadChannel(QString channelUrl)
{
    channelLoading();
    playlistNetworkReader->get(QNetworkRequest(channelUrl));
}

void ServerComm::finishLoadingChannel(QNetworkReply *reply)
{
    QByteArray playlistData = reply->readAll();
    PlaylistReader playlistReader(playlistData);
    PlaylistReader::StreamUrls streamUrls = playlistReader.getStreamUrls();

    QString streamUrl = streamUrls[0];
    mediaplaylist->clear();
    mediaplaylist->addMedia(QUrl(streamUrl));

    player->play();
}

void ServerComm::updateProgress(qint64 time)
{
    int minutes = 0;
    int seconds = 0;

    minutes = (time / 1000) / 60;
    seconds = (time / 1000) % 60;

    QString min_str = QString("%1").arg(minutes, 2, 10, QLatin1Char('0'));
    QString sec_str = QString("%1").arg(seconds, 2, 10, QLatin1Char('0'));

    positionUpdate(min_str, sec_str);
}

void ServerComm::setMediaStatus(QMediaPlayer::MediaStatus state)
{
    switch (state) {
    case QMediaPlayer::BufferingMedia:
        channelLoading();
        break;
    case QMediaPlayer::BufferedMedia:
        channelLoaded();
        break;
    case QMediaPlayer::LoadingMedia:
        channelLoading();
        break;
    case QMediaPlayer::StalledMedia:
        channelLoading();
        break;
    default:
        break;
    }
}
