#include "animationcontroller.h"
#include <QDebug>

AnimationController::AnimationController(QQmlApplicationEngine &engine, QObject *parent) : QObject(parent), engine(engine) {}

void AnimationController::onAnimationCompleted(int type)
{
    qDebug() << "Animation completed!" << type;

    /*
        end left: 1
        end center: 2
    */
    switch (type) {
        case 1:
            qDebug() << "LeftWindow Drawing Completed!";

            slotActivateWindow(1);
            slotStartDrawingWindow(1);
            break;
        case 2:
            qDebug() << "CenterWindow Drawing Completed!";

            slotActivateWindow(2);
            slotStartDrawingWindow(2);
            break;
        default:
            break;
    }

}

void AnimationController::slotActivateWindow(int win) {
    qDebug() << "화면Activate";
    QObject *centerWindow = findObjectByTitle("Center Window");
    QObject *rightWindow = findObjectByTitle("Right Window");

    if (win == 1) {
        centerWindow->setProperty("visible", true);
        QMetaObject::invokeMethod(centerWindow, "requestActivate");
    } else if(win == 2){
        rightWindow -> setProperty("visible", true);
        QMetaObject::invokeMethod(rightWindow, "requestActivate");
    }
}

void AnimationController::slotStartDrawingWindow(int win) {
    QObject *centerWindow = findObjectByTitle("Center Window");
    QObject *rightWindow = findObjectByTitle("Right Window");

    if (win == 1) {
        QMetaObject::invokeMethod(centerWindow, "startDrawing");
    } else if(win == 2){
        QMetaObject::invokeMethod(rightWindow, "startDrawing");
    }

}

QObject* AnimationController::findObjectByTitle(const QString &title) {
    for (auto *object : engine.rootObjects()) {
        QVariant objTitle = object->property("title");
        if (objTitle.isValid() && objTitle.toString() == title) {
            return object;
        }
    }
    return nullptr;
}
