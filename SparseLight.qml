import QtQuick 2.0

Item {
    id: root
    width: 2 * radius
    height: 2 * radius

    property double radius: 12
    property string backgroundColor: "#34393f"
    property string lightColor: "#8BFCEE"
    property bool lightOn: false
    property double lightBrightness: 1.0

    Canvas {
        id: background
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
                context.arc(radius, radius, 0.8 * radius, 0, 2 * Math.PI)
                context.fillStyle = backgroundColor
                context.fill();
            }
        }
    }

    Canvas {
        id: light
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
                context.arc(radius, radius, 0.8 * radius, 0, 2 * Math.PI)
                context.fillStyle = lightColor
                context.fill();
            }
        }

        visible: lightOn
        opacity: lightBrightness
    }
}

