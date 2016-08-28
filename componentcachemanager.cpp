#include "componentcachemanager.h"

ComponentCacheManager::ComponentCacheManager(QQmlApplicationEngine* engine, QObject *parent) : QObject(parent)
{
    m_engine = engine;
}

void ComponentCacheManager::trim()
{
    m_engine->trimComponentCache();
}

void ComponentCacheManager::clear()
{
    m_engine->clearComponentCache();

}

