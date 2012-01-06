#include <QtGui/QApplication>
#include <QtDeclarative>
#include "qmlapplicationviewer.h"
#include "servercomm.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/CuteSoma/main.qml"));



    ServerComm sc;
    viewer.rootContext()->setContextProperty("serverComm", &sc);

    viewer.showExpanded();

    //QObject *root = (QObject*)(viewer.rootObject());


//    QObject::connect(root, SIGNAL(play()), &sc, SLOT(play()));
//    QObject::connect(root, SIGNAL(pause()), &sc, SLOT(pause()));
//    QObject::connect(root, SIGNAL(loadChannel(QString)), &sc, SLOT(loadChannel(QString)));
    //QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));

    return app->exec();
}
