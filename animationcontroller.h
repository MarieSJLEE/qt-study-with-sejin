#ifndef ANIMATIONCONTROLLER_H
#define ANIMATIONCONTROLLER_H

#include <QObject>
#include <QQmlApplicationEngine>

class AnimationController : public QObject
{
    Q_OBJECT

public:
    explicit AnimationController(QQmlApplicationEngine &engine, QObject *parent = nullptr);

public slots:
    void onAnimationCompleted(int message);

    void slotActivateWindow(int win);
    void slotStartDrawingWindow(int win);

private:
    QObject* findObjectByTitle(const QString &title);

    QQmlApplicationEngine &engine;
};

#endif // ANIMATIONCONTROLLER_H
