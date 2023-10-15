import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 360
    height: 360
    title: qsTr("Live Clock")

    Rectangle {
        id: clockRect
        anchors.fill: parent
        color: "black"

        Repeater {
            model: 60
            delegate: Text {
                id: clockText
                property int value: index
                property bool isHour: value % 5 === 0
                property bool isMinute: value % 5 !== 0
                property bool isSecond: value === 0

                font.pixelSize: 20
                color: "white"
                text: value

                x: clockRect.width / 2 + Math.cos(value * Math.PI / 30) * clockRect.width / 2.5
                y: clockRect.height / 2 + Math.sin(value * Math.PI / 30) * clockRect.height / 2.5

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (isHour) {
                            console.log("Hour: " + value)
                        } else if (isMinute) {
                            console.log("Minute: " + value)
                        } else if (isSecond) {
                            console.log("Second: " + value)
                        }
                    }
                }
            }
        }

        Text {
            id: timeText
            anchors.centerIn: parent
            font.pixelSize: 40
            color: "white"

            function updateTime() {
                var now = new Date()
                var hours = now.getHours()
                var minutes = now.getMinutes()
                var seconds = now.getSeconds()

                timeText.text = hours + ":" + minutes + ":" + seconds
            }

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: timeText.updateTime()
            }
        }
    }
















}
