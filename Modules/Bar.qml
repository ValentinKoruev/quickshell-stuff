import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Services.UPower

import "./components"

Scope {
    id: barScope
    property var primaryBg: "#2F2F2F";
    property var secondaryBg: "#3A3A3A"
    property var background3: "#444444"

    property var disabled: "#94B4C1"
    property var active: '#EAE0CF'
    property var focused: '#FFD166'

    PanelWindow {
        id: bar
        anchors {
            top: true
            bottom: true
            left: true
        }

        implicitWidth: 50
        
        color: primaryBg

        // BarDebugLines {}

        ColumnLayout {
            id: layout
            anchors.fill: parent

            anchors.topMargin: 10
            anchors.bottomMargin: 10

            spacing: 10

            LogoWidget {}

            ClockWidget {}
            
            Workspaces {}
            // OldWorkspaces {}

            BatteryCircle {}

            Item {
                Layout.fillHeight: true
            }

        }
    }

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

        Text {
            text: WindowTracker.windowTitle
            anchors.centerIn: parent
            color: focused
            font.bold: true
            font.family: "FiraCode Nerd Font", "monospace"
            font.pixelSize: 12
        }
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