import QtQuick 2.0

Item {
    id: root
    width: 1340
    height: 1340

    property double scaleRatio: 1
    property string color: "#22262a"
    property bool pressedOnHandle: false
    property double axisX: 0
    property double axisY: 0
    property double theta: 0
    property double radius: 0
    readonly property double maxRadius: 275 * scaleRatio

    function update() {
        handle.x = 440 * scaleRatio + maxRadius * axisX
        handle.y = 440 * scaleRatio - maxRadius * axisY

        for (var i = 0; i < lights.lights.count; i++) {
            var tempTheta = -theta

            if (tempTheta < 0)
                tempTheta += 2 * Math.PI

            var angleBetween = Math.abs(tempTheta - lights.lights.itemAt(i).angle)

            lights.lights.itemAt(i).lightOn = (angleBetween < Math.PI / 6 || angleBetween > 2 * Math.PI - Math.PI / 6)
            lights.lights.itemAt(i).lightBrightness = Math.min(axisX * axisX + axisY * axisY, 1)
        }
    }

    function reset() {
        axisX = 0
        axisY = 0
        theta = 0
        pressedOnHandle = false
        root.update()
    }

    onScaleRatioChanged: reset()

    Item {
        id: center
        x: root.width / 2
        y: root.height / 2
    }

    Back {
        x: 158 * scaleRatio
        y: 158 * scaleRatio
        radius: 512 * scaleRatio
        color: root.color
    }

    Groove {
        x: 314 * scaleRatio
        y: 314 * scaleRatio
        radius: 356 * scaleRatio
        color: root.color
    }

    Lights {
        id: lights
        x: 10 * scaleRatio
        y: 10 * scaleRatio
        radius: 660 * scaleRatio
    }

    Handle {
        id: handle
        x: 440 * scaleRatio
        y: 440 * scaleRatio
        radius: 230 * scaleRatio
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

        onReleased: reset()

        onPositionChanged: {
            if (pressedOnHandle) {
                var point = mapToItem(center, mouseX, mouseY)
                var length = Math.sqrt(point.x * point.x + point.y * point.y)
                if (length > maxRadius)
                    length = maxRadius

                theta = Math.atan2(-point.y, point.x)

                axisX = length * Math.cos(theta) / maxRadius
                axisY = length * Math.sin(theta) / maxRadius

                root.update()
            }
        }
    }
}
