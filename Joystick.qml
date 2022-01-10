import QtQuick 2.0

Item {
    id: root
    width: 1340
    height: 1340

    property string color: "#34393f"
    property bool pressedOnHandle: false
    property double axisX: 0
    property double axisY: 0
    property double theta: 0
    property double radius: 0
    readonly property double maxRadius: 275

    function update() {
        theta = Math.atan2(axisY, axisX)

        handle.x = 440 + maxRadius * axisX
        handle.y = 440 - maxRadius * axisY

        for (var i = 0; i < lights.lights.count; i++) {
            var tempTheta = -theta

            if(tempTheta < 0)
                tempTheta += 2 * Math.PI

            var angleBetween = Math.abs(tempTheta - lights.lights.itemAt(i).angle)

            lights.lights.itemAt(i).lightOn = (angleBetween < Math.PI / 4 ||  angleBetween > 2 * Math.PI - Math.PI / 4)
            lights.lights.itemAt(i).lightBrightness = Math.min(axisX * axisX + axisY * axisY, 1)
        }
    }

    Item {
        id: center
        x: root.width / 2
        y: root.height / 2
    }

    Back {
        x: 158
        y: 158
        color: root.color
    }

    Groove {
        x: 314
        y: 314
        color: root.color
    }

    Lights {
        id: lights
        x: 10
        y: 10
    }

    Handle {
        id: handle
        x: 440
        y: 440
        color: root.color

        Item {
            id: handleCenter
            anchors.centerIn: handle
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            var point = mapToItem(handleCenter, mouseX, mouseY)
            pressedOnHandle = point.x * point.x + point.y * point.y < handle.radius * handle.radius
        }

        onReleased: {
            handle.x = 440
            handle.y = 440
            axisX = 0
            axisY = 0
            theta = 0
            pressedOnHandle = false
            root.update()
        }

        onPositionChanged: {
            if (pressedOnHandle) {
                var point = mapToItem(center, mouseX, mouseY)
                axisX =  Math.max(-1, Math.min(point.x / maxRadius, 1))
                axisY = -Math.max(-1, Math.min(point.y / maxRadius, 1))

                root.update()
            }
        }
    }
}
