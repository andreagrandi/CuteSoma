#ifndef SERVERCOMM_H
#define SERVERCOMM_H

#include <QObject>
#include <QString>
#include <QMediaPlayer>

class QNetworkAccessManager;
class QNetworkReply;
class QMediaPlaylist;

class ServerComm : public QObject
{
    Q_OBJECT
public:
    explicit ServerComm(QObject *parent = 0);

private:
    QNetworkAccessManager *playlistNetworkReader;
    QMediaPlayer *player;
    QMediaPlaylist *mediaplaylist;
signals:
    void channelLoading();
    void channelLoaded();
    void positionUpdate(QString minutes, QString seconds);
public slots:
    void play();
    void pause();
    void loadChannel(QString channelUrl);
private slots:
    void updateProgress(qint64 time);
protected slots:
    void finishLoadingChannel(QNetworkReply *reply);
    void setMediaStatus(QMediaPlayer::MediaStatus state);
};

#endif // SERVERCOMM_H
