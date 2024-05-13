import QtQuick 2.10
import QtQuick.Window 2.0
import QtQuick.Controls 2.10

Window {
    id: rightWindow
    visible: true
    width: 400
    height: 300
    title: "Right Window"
    x: Screen.width/2 + 300
    y: Screen.height/2 - height/2

    Rectangle{
        id: pleaseGo
        width: 50
        height: 50
        x: -50
        anchors.verticalCenter: parent.verticalCenter
        border.color: "yellow"
        border.width: 4
        color: "blue"

        property bool animationRunning: false

        NumberAnimation {
            id: plzGogo
            target: pleaseGo
            property: "x"
            from: -10
            to: 400
            duration: 1500
            easing.type: Easing.InOutQuad

            onRunningChanged: {
                console.log("RUNNING!!!!")
                if(!running) {
                    console.log("END!!!!!")
                    pleaseGo.animationRunning = false;
                    animationController.onAnimationCompleted(3);
                }
            }
        }
    }
    function startDrawing() {
        console.log("Drawing animation started.");
        if (!pleaseGo.animationRunning) {
            console.log("여기가 실행 됐냐?")
            plzGogo.start();
            pleaseGo.animationRunning = true;
        }
    }
}
