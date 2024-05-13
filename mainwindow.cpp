#include "mainwindow.h"
#include "animationcontroller.h"
#include <QDebug>
#include <QQmlContext>

MainWindow::MainWindow() : animationController(nullptr) {
    initialize();
}

MainWindow::~MainWindow() {
    delete animationController;
}

void MainWindow::initialize() {
    animationController = new AnimationController(engine, this);
    engine.rootContext()->setContextProperty("animationController", animationController);

    engine.load(QUrl(QStringLiteral("qrc:/CenterWindow.qml")));
    engine.load(QUrl(QStringLiteral("qrc:/LeftWindow.qml")));
    engine.load(QUrl(QStringLiteral("qrc:/RightWindow.qml")));
}
