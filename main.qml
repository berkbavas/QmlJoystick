import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1366
    height: 768
    visible: true
    color: "#111111"

    Joystick {
        anchors.centerIn: parent
        scale: 0.65
    }
}
