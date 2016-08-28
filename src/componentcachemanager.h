#ifndef COMPONENTCACHEMANAGER_H
#define COMPONENTCACHEMANAGER_H

#include <QObject>
#include <QQmlApplicationEngine>

class ComponentCacheManager : public QObject
{
    Q_OBJECT
public:
    explicit ComponentCacheManager(QQmlApplicationEngine *engine, QObject *parent = 0);

    Q_INVOKABLE void trim();
    Q_INVOKABLE void clear();

private:
    QQmlApplicationEngine* m_engine;

signals:

public slots:
};

#endif // COMPONENTCACHEMANAGER_H
