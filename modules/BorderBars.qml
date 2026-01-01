import Quickshell
import QtQuick.Effects

import "../components"
import "../widgets"

Scope {
    PanelWindow {
        anchors {
            top: true
            bottom: true
            right: true
        }

        implicitWidth: 10
        
        color: primaryBg
    }

    PanelWindow {
        anchors {
            top: true
            right: true
            left: true
        }

        implicitHeight: 30
        
        color: primaryBg

        WindowTitleWidget { }
    }

    PanelWindow {
        anchors {
            bottom: true
            right: true
            left: true
        }

        implicitHeight: 10
        
        color: primaryBg
    }

    PanelWindow {
        id: overlay
        color: "transparent"

        anchors {
            bottom: true
            right: true
            left: true
            top: true
        }

        RectangularShadow {
            width: 2
            height: overlay.height
            offset.x: 0
            offset.y: 0
            radius: 0
            blur: 30
            spread: 10
            color: "#0c0c0c"
        }

        RectangularShadow {
            width: 2
            height: overlay.height
            offset.x: overlay.width
            offset.y: 0
            radius: 0
            blur: 30
            spread: 10
            color: "#0c0c0c"
        }

        RectangularShadow {
            width: overlay.width
            height: 2
            offset.x: 0
            offset.y: 0
            radius: 0
            blur: 30
            spread: 10
            color: "#0c0c0c"
        }

         RectangularShadow {
            width: overlay.width
            height: 2
            offset.x: 0
            offset.y: overlay.height
            radius: 0
            blur: 30
            spread: 10
            color: "#0c0c0c"
        }
        
        CornerArc {
            corner: "topLeft"
            radius: 40
            color: primaryBg
            anchors.left: parent.left
        }
        CornerArc {
            corner: "topRight"
            radius: 40
            color: primaryBg
            anchors.right: parent.right
        }
        CornerArc {
            corner: "bottomLeft"
            radius: 40
            color: primaryBg
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }
        CornerArc {
            corner: "bottomRight"
            radius: 40
            color: primaryBg
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }

        mask: Region {
            intersection: Intersection.Subtract

            Region {
                x: 0
                y: 0
                width: overlay.width
                height: overlay.height
            }
        }
    }
}