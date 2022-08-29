#include "dict.h"
#include <QDebug>
#include <QTextCodec>

dict::dict()
{
    // Create database.
    QString name = "اسماعیل";


    qDebug()<<name;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE", "Connection");
    db.setDatabaseName("NEWDATABASE.db");
    if (!db.open()) {
        qDebug("Error occurred opening the database.");
        qDebug("%s.", qPrintable(db.lastError().text()));
    }
    qDebug()<<db.tables();
    // Insert table.
    QSqlQuery query(db);
    //query.

    query.prepare("CREATE TABLE IF NOT EXISTS Dict3 (word TEXT PRIMARY KEY, mean TEXT NOT NULL,who TEXT NOT NULL)");
    if (!query.exec()) {
        qDebug("Error occurred creating table.");
        qDebug("%s.", qPrintable(db.lastError().text()));;
    }

    // Insert row.
    query.prepare("INSERT INTO Dict3 (word,mean,who) VALUES ('قال','گفت','اسماعیل')");
    if (!query.exec()) {
        qDebug("Error occurred inserting.");
        qDebug("%s.", qPrintable(db.lastError().text()));
    }
    // Query.
    query.prepare("SELECT * FROM Dict3");
    if (!query.exec()) {
        qDebug("Error occurred querying.");
        qDebug("%s.", qPrintable(db.lastError().text()));
    }
    while (query.next()) {
        qDebug("WORD = %s, MEAN = %s, WHO = %s.", qPrintable(query.value(0).toString()),
               qPrintable(query.value(1).toString().toUtf8()),qPrintable(query.value(2).toString()));
    }
}
