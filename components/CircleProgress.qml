import QtQuick

Item {
    id: root
    property int percent: 0
    property color progressColor: "#4CAF50"
    property color backgroundColor: "#333"
    property real lineWidth: 5
    property var lineCap: "butt"

    property bool showText: false
    property color textColor: "#333"
    property int textSize: 12
    property bool textBold: true

    implicitWidth: 40
    implicitHeight: 40

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)

            var centerX = width / 2
            var centerY = height / 2
            var radius = Math.min(width, height) / 2 - root.lineWidth

            // Background circle
            ctx.beginPath()
            ctx.strokeStyle = root.backgroundColor
            ctx.lineWidth = root.lineWidth
            ctx.arc(centerX, centerY, radius, 0, Math.PI * 2)
            ctx.stroke()

            // Progress arc
            ctx.beginPath()
            ctx.strokeStyle = root.progressColor
            ctx.lineWidth = root.lineWidth
            ctx.lineCap = root.lineCap
            ctx.arc(
                centerX,
                centerY,
                radius,
                -Math.PI / 2,
                -Math.PI / 2 + (Math.PI * 2 * (root.percent / 100))
            )
            ctx.stroke()
        }
        Connections {
            target: root
            function onPercentChanged() { canvas.requestPaint() }
            function onProgressColorChanged() { canvas.requestPaint() }
            function onBackgroundColorChanged() { canvas.requestPaint() }
            function onLineWidthChanged() { canvas.requestPaint() }
            function onWidthChanged() { canvas.requestPaint() }
            function onHeightChanged() { canvas.requestPaint() }
        }
    }

    Behavior on percent {
        NumberAnimation {
            duration: 400
            easing.type: Easing.OutCubic
        }
    }

    Loader {
        anchors.centerIn: parent
        active: showText
        sourceComponent: Text {
            text: percent
            color: root.textColor
            font.pixelSize: root.textSize
            font.bold: root.textBold
            font.family: "FiraCode Nerd Font", 'monospace'
            // for offset if need be
            // x: parent.width / 2 - width / 2 - 1  
            
        }
    }
}
