#include <QtGui/QApplication>
#include <QtDeclarative>
#include "servercomm.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QDeclarativeView view;
    view.setSource(QUrl("qrc:/qml/main.qml"));

    QObject *root = (QObject*)(view.rootObject());

    ServerComm sc;
    view.rootContext()->setContextProperty("serverComm", &sc);

    QObject::connect(root, SIGNAL(play()), &sc, SLOT(play()));
    QObject::connect(root, SIGNAL(pause()), &sc, SLOT(pause()));
    QObject::connect(root, SIGNAL(loadChannel(QString)), &sc, SLOT(loadChannel(QString)));
    QObject::connect((QObject*)view.engine(), SIGNAL(quit()), &app, SLOT(quit()));

    view.showFullScreen();

    return app.exec();
}
