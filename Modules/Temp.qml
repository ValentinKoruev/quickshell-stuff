// PanelWindow {
//    width: 300
//    height: 300
//    color: "#ffffff" 
//    RectangularShadow {
//     anchors.fill: myRectangle
//     offset.x: 2
//     offset.y: 0
//     radius: myRectangle.radius
//     blur: 10
//     spread: 2
//     color: Qt.darker(myRectangle.color, 1.6)
// }
// Rectangle {
//     id: myRectangle
//     anchors.centerIn: parent
//     width: 280
//     height: 280
//     radius: 30
//     color: "transparent"
// }
// mask: Region { item: myRectangle}   // empty region => nothing is clickable; all clicks pass through
// }

import QtQuick
import QtQuick.Shapes

PanelWindow {
    id: win
    width: 1920
    height: 1080
    color: "transparent"

    // Outer rect
    property int outerW: 1920
    property int outerH: 1080
    property int outerR: 0

    // Inner hole
    property int innerW: 1900
    property int innerH: 1060
    property int innerR: 30

    Item {
        id: frame
        anchors.centerIn: parent
        width: outerW
        height: outerH

        Shape {
            anchors.fill: parent

            ShapePath {
                fillColor: "white"
                strokeColor: "transparent"
                fillRule: ShapePath.OddEvenFill

                // ---- OUTER ROUNDED RECT PATH ----
                startX: outerR
                startY: 0

                PathLine { x: frame.width - outerR; y: 0 }
                PathArc  { x: frame.width; y: outerR; radiusX: outerR; radiusY: outerR }

                PathLine { x: frame.width; y: frame.height - outerR }
                PathArc  { x: frame.width - outerR; y: frame.height; radiusX: outerR; radiusY: outerR }

                PathLine { x: outerR; y: frame.height }
                PathArc  { x: 0; y: frame.height - outerR; radiusX: outerR; radiusY: outerR }

                PathLine { x: 0; y: outerR }
                PathArc  { x: outerR; y: 0; radiusX: outerR; radiusY: outerR }

                // ---- INNER ROUNDED RECT PATH (HOLE) ----
                PathMove {
                    x: (frame.width - innerW) / 2 + innerR
                    y: (frame.height - innerH) / 2
                }

                PathLine {
                    x: (frame.width + innerW) / 2 - innerR
                    y: (frame.height - innerH) / 2
                }
                PathArc {
                    x: (frame.width + innerW) / 2
                    y: (frame.height - innerH) / 2 + innerR
                    radiusX: innerR; radiusY: innerR
                }

                PathLine {
                    x: (frame.width + innerW) / 2
                    y: (frame.height + innerH) / 2 - innerR
                }
                PathArc {
                    x: (frame.width + innerW) / 2 - innerR
                    y: (frame.height + innerH) / 2
                    radiusX: innerR; radiusY: innerR
                }

                PathLine {
                    x: (frame.width - innerW) / 2 + innerR
                    y: (frame.height + innerH) / 2
                }
                PathArc {
                    x: (frame.width - innerW) / 2
                    y: (frame.height + innerH) / 2 - innerR
                    radiusX: innerR; radiusY: innerR
                }

                PathLine {
                    x: (frame.width - innerW) / 2
                    y: (frame.height - innerH) / 2 + innerR
                }
                PathArc {
                    x: (frame.width - innerW) / 2 + innerR
                    y: (frame.height - innerH) / 2
                    radiusX: innerR; radiusY: innerR
                }
            }
        }
    }

    // INPUT MASK: outer clickable, inner click-through (outer - inner)
    mask: Region {
        intersection: Intersection.Subtract
      //   Region { item: frame }
        Region {
            x: frame.x + (frame.width - innerW) / 2
            y: frame.y + (frame.height - innerH) / 2
            width: innerW
            height: innerH
        }
    }
}
