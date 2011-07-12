#ifndef SERVERCOMM_H
#define SERVERCOMM_H

#include <QObject>
#include <phonon/MediaObject>
#include <QString>

class QNetworkAccessManager;
class QNetworkReply;

class ServerComm : public QObject
{
    Q_OBJECT
public:
    explicit ServerComm(QObject *parent = 0);

private:
    Phonon::MediaObject *media;
    QNetworkAccessManager *playlistNetworkReader;
signals:
    void channelLoading();
    void channelLoaded();
public slots:
    void play();
    void pause();
    void loadChannel(QString channelUrl);

protected slots:
    void finishLoadingChannel(QNetworkReply *reply);
};

#endif // SERVERCOMM_H
