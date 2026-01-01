pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property var windowTitle: ""

    Process {
        id: windowProc
        command: ['hyprctl', 'activewindow']

        running: true

        stdout: SplitParser {
            onRead: data => {
                const line = data.trim();

                if(line === "Invalid") {
                    return root.windowTitle = "Desktop"
                }

                const p = line.split(": ");

                if(p[0] == 'title')
                    root.windowTitle = p[1] ?? "Desktop"
            }
        }
    }

    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: windowProc.running = true
    }
}