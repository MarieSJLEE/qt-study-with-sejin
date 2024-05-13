import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.13

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text{
        text: qsTr("HelloWorld")
        anchors.centerIn: parent
        font.pixelSize: 40
        color: "blue"
        font.bold: true

        MouseArea{
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }

    Rectangle {
        id: rectangle
        x: 20
        width: 200
        color: "#f9d486"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top

        Column {
            id: column
            x: 220
            y: 40
            width: 200
            height: 400
            anchors.horizontalCenterOffset: 15
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 25

            Button {
                id: button
                //y: 25
                height: 40
                text: qsTr("Button")
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    element.text = "HelloWorld"
                }
            }

            Text {
                id: element
                width: 0
                height: 29
                text: qsTr("Text")
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
            }

        }
    }
}

/*##^##
Designer {
    D{i:3;anchors_height:200;anchors_width:200;anchors_x:20;anchors_y:7}
}
##^##*/
