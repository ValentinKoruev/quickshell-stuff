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
    property var primaryBg: "#213448";
    property var secondaryBg: "#547792"

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


        ColumnLayout {
            id: layout
            anchors.fill: parent

            anchors.topMargin: 8
            anchors.bottomMargin: 8

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
            
            Rectangle {
                Layout.alignment: Qt.AlignHCenter

                color: secondaryBg

                property var padding: 6

                Column {
                    id: wsList
                    anchors.centerIn: parent
                    spacing: 4

                    Repeater {
                        model: Hyprland.workspaces.values
                        anchors.horizontalCenter: parent.horizontalCenter

                        Text {
                            property bool isSpecialWs: modelData.name.startsWith("special:")
                            property bool isActive: {
                                // console.log(Hyprland.activeToplevel)
                                if(isSpecialWs) return Hyprland.activeToplevel?.workspace.id === modelData.id

                                return Hyprland.focusedWorkspace?.id === modelData.id
                            }
                            text: isSpecialWs
                                    ? modelData.name.substring(8, 9)
                                    : ""
                            color: isActive ? barScope.focused : barScope.active
                            font { pixelSize: 11; bold: isSpecialWs }
                            font.family: !isSpecialWs ? "FiraCoda Nerd Font, monospace" : "Symbols Nerd Font"

                            anchors.horizontalCenter: parent.horizontalCenter

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: modelData.id > 0 ? Hyprland.dispatch("workspace " + (modelData.id)) : Hyprland.dispatch("togglespecialworkspace magic")
                            }
                        }
                    }
                }
                implicitWidth: wsList.implicitWidth + (padding * 2)   // 2x margins
                implicitHeight: wsList.implicitHeight + (padding * 2)
                radius: 100
            }

            BatteryCircle {}

            Item {
                Layout.fillHeight: true
            }
        }
    }
}