#ifndef SERVERCOMM_H
#define SERVERCOMM_H

#include <QObject>
#include <phonon/MediaObject>
#include <QString>

class ServerComm : public QObject
{
    Q_OBJECT
public:
    explicit ServerComm(QObject *parent = 0);

private:
    Phonon::MediaObject *media;

signals:

public slots:
    void play();
    void pause();
    void loadChannel(QString channel);
};

#endif // SERVERCOMM_H
