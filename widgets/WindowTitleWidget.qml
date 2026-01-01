import Quickshell
import QtQuick

import '../services'

Text {
    text: WindowTracker.windowTitle
    anchors.centerIn: parent
    color: focused
    font.bold: true
    font.family: "FiraCode Nerd Font", "monospace"
    font.pixelSize: 12
}