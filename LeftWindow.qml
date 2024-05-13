import QtQuick 2.10
import QtQuick.Controls 2.10
import QtQuick.Window 2.10

Window {
    id: leftWindow
    visible: true
    width: 400
    height: 300
    title: "Left Window"
    x: Screen.width / 2 - width - 300
    y: Screen.height / 2 - height / 2

    signal drawFinished(int message)

    Rectangle {
        id: pleaseGo
        width: 50
        height: 50
        x: 100
        anchors.verticalCenter: parent.verticalCenter
        border.color: "yellow"
        border.width: 4
        color: "blue"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                plzGogo.start()
            }
        }

        NumberAnimation {
            id: plzGogo
            target: pleaseGo
            property: "x"
            from: 100
            to: 400
            duration: 1500
            easing.type: Easing.InOutQuad

            onRunningChanged: {
                if(!running){
                    animationController.onAnimationCompleted(1)
                }
            }
        }
    }
}
