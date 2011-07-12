#include "servercomm.h"
#include <QDebug>
#include <phonon/AudioOutput>

ServerComm::ServerComm(QObject *parent) :
    QObject(parent)
{
    media = new Phonon::MediaObject(this);
    Phonon::AudioOutput *audioOutput = new Phonon::AudioOutput(Phonon::MusicCategory, this);
    Phonon::createPath(media, audioOutput);
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
