#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QObject>
#include <QQmlApplicationEngine>
#include "animationcontroller.h"

class MainWindow : public QObject {

    Q_OBJECT

public:
    explicit MainWindow();
    ~MainWindow();

    void initialize();

    private:
        QQmlApplicationEngine engine;
        AnimationController* animationController;

        QObject* findObjectByTitle(const QString &title);
};

#endif // MAINWINDOW_H
