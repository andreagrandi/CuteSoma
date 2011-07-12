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

    media->setTickInterval(500);
    QObject::connect(media, SIGNAL(tick(qint64)), this, SLOT(updateProgress(qint64)));
}

void ServerComm::play()
{
    media->play();
}

void ServerComm::pause()
{
    media->pause();
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
    media->setCurrentSource(QUrl(streamUrl));

    media->play();
    channelLoaded();
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
