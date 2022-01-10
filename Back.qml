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
        if(context)
        {
            context.reset()
            context.beginPath();
            context.arc(radius, radius, 508 / 512 * radius, 0, 2 * Math.PI);
            context.fillStyle = root.color
            context.fill();
        }
    }

    layer.enabled: true
    layer.effect: InnerShadow {
        color: "#80000000"
        radius: 64 / 512 * root.radius
        samples: 32
    }
}

