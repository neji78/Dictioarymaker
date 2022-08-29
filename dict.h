#ifndef DICT_H
#define DICT_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QVariant>
#include <QAbstractTableModel>
#include <QQmlEngine>
#include <QQmlApplicationEngine>
#include <qqml.h>
#include <QtQml>

class dict:public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    dict();

};

#endif // DICT_H
