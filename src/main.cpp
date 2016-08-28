#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QStandardPaths>
#include "componentcachemanager.h"

const QString HOME_LOCATION = QStandardPaths::writableLocation(QStandardPaths::HomeLocation);
const QString DOCUMENTS_LOCATION = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation);

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine* engine = new QQmlApplicationEngine();

    ComponentCacheManager ccm(engine);
    engine->rootContext()->setContextProperty("componentCache", &ccm);
    engine->rootContext()->setContextProperty("homePath", HOME_LOCATION);
    engine->rootContext()->setContextProperty("documentsPath", DOCUMENTS_LOCATION);
    engine->load(QUrl(QStringLiteral("qrc:///Main.qml")));
    return app.exec();
}
