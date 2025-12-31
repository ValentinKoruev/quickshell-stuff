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
    property var active: "#94B4C1"
    property var focused: "#EAE0CF"

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

            Rectangle {
                width: parent.width

                color: primaryBg

                Layout.alignment: Qt.AlignHCenter

                Text {
                    id: archLogo
                    anchors.centerIn: parent
                    text: "󰣇"
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 18
                    color: barScope.focused 
                    Layout.alignment: Qt.AlignHCenter
                }

                height: archLogo.implicitHeight
            }

            ClockWidget {}
            
            // Workspaces {}
            OldWorkspaces {}

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

        implicitWidth: 20
        
        color: primaryBg
    }

    PanelWindow {
        anchors {
            top: true
            right: true
            left: true
        }

        implicitHeight: 20
        
        color: primaryBg
    }

    PanelWindow {
        anchors {
            bottom: true
            right: true
            left: true
        }

        implicitHeight: 20
        
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