import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

import "../services"

Item {
    id: wifiWidget
    Layout.alignment: Qt.AlignHCenter

    Rectangle {
        anchors.centerIn: parent

        color: "transparent"

        width: 30
        height: 30

        Text {
            text: Wifi.getCurrentConnectionSignalIcon()
            color: wifiPopup.visible ? focused : active
            font.pixelSize: 20
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                wifiPopup.visible = !wifiPopup.visible

                if(wifiPopup.visible && !Wifi.refreshing) {
                    Wifi.refresh()
                }
            }
        }
    }

    PopupWindow {
        anchor.window: bar
        anchor.rect.x: (bar.width)
        anchor.rect.y: wifiWidget.y - 170
        id: wifiPopup

        implicitWidth: visible ? 300 : 50
        implicitHeight: 200

        Behavior on implicitWidth {
            NumberAnimation {
                duration: 40
                easing.type: Easing.OutExpo
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "#222"

            Column {
                width: parent.width
                height: parent.height

                Loader {
                    id: myLoader
                    active: Wifi.currentConnection
                    sourceComponent: Text {
                        text: Wifi.currentConnection.name
                        color: "yellow"
                    }
                }
                
                Repeater {
                    model: Wifi.getConnections()

                    Text {
                        text: model.name
                        color: "#fff"
                    }
                }
            }
        }

    }
}