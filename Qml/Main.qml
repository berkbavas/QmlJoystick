import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 800
    height: 800
    visible: true
    color: "#22262a"

    Joystick {
        anchors.centerIn: parent
        width: 1340 * scaleRatio
        height: 1340 * scaleRatio
        color: window.color
        scaleRatio: 0.7 * Math.min(window.height / 1366, window.width / 768)
    }
}
