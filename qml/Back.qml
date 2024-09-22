import QtQuick 2.0
import QtGraphicalEffects 1.0

Canvas {
    property double radius: 512
    property string color: "#34393f"

    id: root
    width: 2 * radius
    height: 2 * radius
    antialiasing: true
    smooth: true
    contextType: '2d'
    onPaint: {
        if (context) {
            context.reset()
            context.beginPath()
            context.arc(radius, radius, 0.99 * radius, 0, 2 * Math.PI)

            var gradient = context.createLinearGradient(0, 0, width, height)
            gradient.addColorStop(0, Qt.darker(root.color, 1.25))
            gradient.addColorStop(1, Qt.lighter(root.color, 1.25))

            context.fillStyle = gradient
            context.fill()
        }
    }

    layer.enabled: false
    layer.effect: InnerShadow {
        color: "#80000000"
        radius: 64 / 512 * root.radius
        samples: 32
    }
}
