import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

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