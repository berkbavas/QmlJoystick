import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property double radius: 230
    property string color: "#34393f"
    property string lightColor: "#8bfcee"

    id: root
    width: 2 * radius
    height: 2 * radius

    Rectangle {
        anchors.centerIn: root
        width: 2 * radius
        height: 2 * radius
        radius: 0.94 * root.radius
        color: root.color
        layer.enabled: true
        layer.effect: DropShadow {
            color: "#80000000"
            radius: 48 / 230 * root.radius
            samples: 32
        }
    }

    Canvas {
        x: 0
        y: 0
        width: 2 * radius
        height: 2 * radius
        antialiasing: true
        smooth: true
        contextType: '2d'
        onPaint: {
            if (context) {
                context.reset()
                context.beginPath()
                context.arc(radius, radius, 228 / 230 * radius, 0, 2 * Math.PI)
                context.fillStyle = root.color
                context.fill()

                context.strokeStyle = Qt.lighter(root.color, 1.25)
                context.lineWidth = 2 / 230 * radius
                context.stroke()

                context.lineWidth = 6 / 230 * radius
                context.lineJoin = "round"

                for (let i = 0; i < 4; i++) {
                    context.translate(radius, radius)
                    context.rotate(i * Math.PI / 2)
                    context.translate(-radius, -radius)

                    context.beginPath()
                    context.moveTo(214 / 230 * radius, 64 / 230 * radius)
                    context.lineTo(230 / 230 * radius, 48 / 230 * radius)
                    context.lineTo(246 / 230 * radius, 64 / 230 * radius)
                    context.shadowColor = lightColor
                    context.shadowBlur = 8 / 230 * radius
                    context.shadowOffsetX = 0
                    context.shadowOffsetY = 0
                    context.strokeStyle = lightColor
                    context.stroke()
                }
            }
        }

        layer.enabled: true
        layer.effect: InnerShadow {
            color: "#80000000"
            radius: 48 / 230 * root.radius
            samples: 32
        }
    }
}
