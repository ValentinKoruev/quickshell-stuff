import QtQuick

Canvas {
    id: cornerArc
    property color color: "steelblue"
    property int radius: 40 
    property string corner: "topLeft" // "topLeft", "topRight", "bottomLeft", "bottomRight"

    width: radius
    height: radius

    Component.onCompleted: requestPaint()
    onPaint: {
        const ctx = getContext("2d")
        ctx.clearRect(0, 0, width, height)

        ctx.fillStyle = color
        ctx.beginPath()

        switch(corner) {
            case "topLeft":
                ctx.moveTo(width, 0)
                ctx.lineTo(0, 0)
                ctx.lineTo(0, height)
                ctx.arcTo(0, 0, width, 0, radius)
                break

            case "topRight":
                ctx.moveTo(0, 0)
                ctx.lineTo(width, 0)
                ctx.lineTo(width, height)
                ctx.arcTo(width, 0, 0, 0, radius)
                break

            case "bottomLeft":
                ctx.moveTo(0, 0)
                ctx.lineTo(0, height)
                ctx.lineTo(width, height)
                ctx.arcTo(0, height, 0, 0, radius)
                break

            case "bottomRight":
                ctx.moveTo(width, 0)
                ctx.lineTo(width, height)
                ctx.lineTo(0, height)
                ctx.arcTo(width, height, width, 0, radius)
                break
        }

        ctx.closePath()
        ctx.fill()
    }
}