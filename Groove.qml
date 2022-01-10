import QtQuick 2.0
import QtGraphicalEffects 1.0

Canvas {
    property double radius: 356
    property string color: "#34393f"

    id: root
    width: 2 * radius
    height: 2 * radius
    antialiasing: true
    smooth: true
    contextType: '2d'
    onPaint: {
        if(context)
        {
            context.reset()
            context.beginPath()
            context.arc(radius, radius, 350 / 356 * radius, 0, 2 * Math.PI);
            context.fillStyle = root.color
            context.fill()
            context.strokeStyle = Qt.lighter(root.color, 1.25)
            context.lineWidth = 6 / 356 * radius
            context.stroke()
        }
    }

    layer.enabled: true
    layer.effect:
        DropShadow {
        color: "#40000000"
        horizontalOffset: 24 / 356 * root.radius
        verticalOffset: 24 / 356 * root.radius
        radius: 32 / 356 * root.radius
        samples: 32
    }
}
