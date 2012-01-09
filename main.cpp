#include <QtGui/QApplication>
#include <QtDeclarative>
#include "qmlapplicationviewer.h"
#include "servercomm.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    ServerComm sc;
    QmlApplicationViewer viewer;
    viewer.rootContext()->setContextProperty("serverComm", &sc);
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/CuteSoma/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
