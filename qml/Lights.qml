import QtQuick 2.0

Item {
    id: root
    width: 2 * radius
    height: 2 * radius

    property double radius: 660
    property alias lights: lights

    Repeater {
        id: lights
        model: 36
        SparseLight {
            property double angle: 2 * index * Math.PI / 36
            radius: 12 / 660 * root.radius
            lightOn: false
            lightBrightness: 0
            x: root.radius - radius + (root.radius - radius) * Math.cos(angle)
            y: root.radius - radius + (root.radius - radius) * Math.sin(angle)
        }
    }
}
