import Quickshell
import QtQuick
import QtQuick.Layouts

import "./"

Rectangle {
    width: parent.width

    Column {
        id: timeColumn
        anchors.fill: parent
        spacing: 0

        Repeater {
            model: [Time.hour, Time.minutes]
            Text {
                text: modelData
                font.pixelSize: 14
                font.bold: true
                font.family: "FiraCode Nerd Font", "monospace"
                color: focused
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

    }
    height: timeColumn.implicitHeight
    color: primaryBg
}