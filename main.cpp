#include <QtGui/QApplication>
#include <QtDeclarative>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QDeclarativeView view;
    view.setSource(QUrl("qrc:/qml/main.qml"));

    QObject::connect((QObject*)view.engine(), SIGNAL(quit()), &app, SLOT(quit()));

//#if defined MEEGO_EDITION
    view.showFullScreen();
//#else
//    view.showNormal();
//#endif

    return app.exec();
}
