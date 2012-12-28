#include <QtGui/QApplication>
#include <QtDeclarative>
#include <QGLWidget>
#include <QGLFormat>
#include "qmlapplicationviewer.h"
#include "servercomm.h"
#include <QDebug>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication::setStartDragDistance(16);
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    qDebug("CuteSoma started");
    ServerComm sc;

    // GL viewport increases performance on blackberry
    QGLFormat format = QGLFormat::defaultFormat();
    format.setSampleBuffers(false);
    QGLWidget *glWidget = new QGLWidget(format);
    glWidget->setAutoFillBackground(false);

    QmlApplicationViewer viewer;
    viewer.setViewport(glWidget);

    // More gfx performance
    viewer.setViewportUpdateMode(QGraphicsView::FullViewportUpdate);
    viewer.setAttribute(Qt::WA_OpaquePaintEvent);
    viewer.setAttribute(Qt::WA_NoSystemBackground);
    viewer.viewport()->setAttribute(Qt::WA_OpaquePaintEvent);
    viewer.viewport()->setAttribute(Qt::WA_NoSystemBackground);
    
    viewer.rootContext()->setContextProperty("serverComm", &sc);
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/CuteSoma/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
