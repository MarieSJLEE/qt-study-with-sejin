import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.10


Window {
    id: centerWindow
    visible: true
    width: 600
    height: 300
    title: "Center Window"
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2

    Image {
        source: 'qrc:/carImage.png'
        id: pleaseGo
        width: 100
        height: 100
        x: -200
        anchors.verticalCenter: parent.verticalCenter

        property bool animationRunning: false
        property int cnt: 0

        onXChanged: {
            //console.log("x 값 변경됨: " + x)
            if(x >= 160){
                if(!cnt){
                    console.log("Center딱 한번만 찍혀야됨")
                    animationController.onAnimationCompleted(2)
                    cnt++;
                }
            }
        }

        NumberAnimation {
            id: plzGogo
            target: pleaseGo
            property: "x"
            from: -200
            to: 1000
            duration: 6750
            easing.type: Easing.InOutQuad

            onRunningChanged: {
                console.log("STAUS CHANGED!!!!")
                if(!running) {
                    console.log("END!!!!!")
                    pleaseGo.animationRunning = false;
                }
            }
        }
    }

    function startDrawing() {
        console.log("Drawing animation started.");
        if (!pleaseGo.animationRunning) {
            plzGogo.start();
            pleaseGo.animationRunning = true;
        }
    }
}

