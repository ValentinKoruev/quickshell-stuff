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

        property var formatedHour: Time.timeOfDay === "AM" ? Time.hour : (parseInt(Time.hour) + 12)

        Repeater {
            model: [parent.formatedHour, Time.minutes]
            Text {
                text: modelData
                font.pixelSize: 14
                font.bold: false
                font.family: "FiraCode Nerd Font, monospace"
                color: focused
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

    }
    height: timeColumn.implicitHeight
    color: primaryBg
}