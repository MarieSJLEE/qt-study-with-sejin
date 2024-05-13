#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "mainwindow.h"
#include "animationcontroller.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    MainWindow mainWindow;
    mainWindow.initialize();

    return app.exec();
}
