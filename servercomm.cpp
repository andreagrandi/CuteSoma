#include "servercomm.h"
#include "playlistreader.h"
#include <QDebug>
#include <phonon/AudioOutput>
#include <QUrl>
#include <QNetworkAccessManager>
#include <QNetworkReply>

ServerComm::ServerComm(QObject *parent) :
    QObject(parent)
{
    media = new Phonon::MediaObject(this);
    Phonon::AudioOutput *audioOutput = new Phonon::AudioOutput(Phonon::MusicCategory, this);
    Phonon::createPath(media, audioOutput);

    playlistNetworkReader = new QNetworkAccessManager(this);
    connect(playlistNetworkReader, SIGNAL(finished(QNetworkReply*)), this, SLOT(finishLoadingChannel(QNetworkReply*)));
}

void ServerComm::play()
{
    qDebug() << "Play";
    media->play();
}

void ServerComm::pause()
{
    qDebug() << "Pausing";
    media->pause();
}

void ServerComm::loadChannel(QString channelUrl)
{
    qDebug() << "Playing: " + channelUrl;
    channelLoading();
    playlistNetworkReader->get(QNetworkRequest(channelUrl));
}

void ServerComm::finishLoadingChannel(QNetworkReply *reply)
{
    QByteArray playlistData = reply->readAll();
    qDebug() << "playlist info: " << playlistData;
    PlaylistReader playlistReader(playlistData);
    // now get the stream urls of the playlist
    PlaylistReader::StreamUrls streamUrls = playlistReader.getStreamUrls();
    qDebug() << "stream urls: " << streamUrls;

    QString streamUrl = streamUrls[0];
    media->setCurrentSource(QUrl(streamUrl));

    media->play();
    channelLoaded();
}
