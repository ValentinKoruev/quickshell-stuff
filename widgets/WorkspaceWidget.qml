import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: rect
    width: 30

    Layout.alignment: Qt.AlignHCenter
    color: background3
    radius: 100

    property int cellSpacing: 20
    property int padding: 50

    property int expandedCellSize: 20
    property int inactiveCellSize: 10

    property int transition: 200

    Column {
        id: wsList
        spacing: parent.cellSpacing
        anchors.centerIn: parent

        property var focusedWorkspace: Hyprland.focusedWorkspace
        property var workspaces: Hyprland.workspaces.values;

        Repeater {
            model: 5

            Rectangle {
                id: wsRect
                
                property var wsOffset: wsList.focusedWorkspace.id > 5 ? 5 : 0
                property var workspace: wsList.workspaces.find(w => w.id === index + 1 + wsOffset)
                
                property bool isFocused: workspace?.id === wsList.focusedWorkspace.id
                property bool isActive: workspace ?? false

                width: rect.expandedCellSize
                height: rect.expandedCellSize
                color: "transparent"
                radius: 100

                Rectangle {
                    width: isFocused ? rect.expandedCellSize : rect.inactiveCellSize
                    height: isFocused ? rect.expandedCellSize : rect.inactiveCellSize
                    color: {
                        if(isFocused) return focused

                        if(isActive) return active

                        return '#2e2929'
                    }
                    radius: 100
        
                    anchors.centerIn: parent

                    Behavior on width {
                        NumberAnimation {
                            duration: rect.transition
                            easing.type: Easing.InOutCubic
                        }
                    }
                    Behavior on height {
                        NumberAnimation {
                            duration: rect.transition
                            easing.type: Easing.InOutCubic
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: Hyprland.dispatch("workspace " + (index + 1 + wsOffset))
                    }
                }
            }
        }
    }    

    implicitHeight: wsList.height + (padding / 2)
}