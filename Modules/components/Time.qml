pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    property var dayOfWeek: "Mon"
    property var month: "Jan"
    property var day: "1"
    property var hour: "00"
    property var minutes: "00"
    property var seconds: "00"
    property var timeOfDay: "AM"
    property var year: "1967"

    Process {
        id: dateProc
        command: ["date"]

        running: true

        stdout: SplitParser {
            onRead: data => {
                // Ex. Output: 
                // Mon Dec 29 02:43:12 AM EET 2025
                let p = data.split(" ");
                
                dayOfWeek = p[0];
                month = p[1];
                day = p[2];

                let time = p[3].split(":");
                hour = time[0]
                minutes = time[1]
                seconds = time[2]

                timeOfDay = p[4]

                year = p[6]
            }
        }
    }


    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}