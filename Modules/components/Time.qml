pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property var day: "1"
    property var dayName: "Monday"
    property var dayShortName: "Mon"

    property var month: "1"
    property var monthName: "January"
    property var monthShortName: "Jan"

    property var year: "1967"

    property var hour: "00"
    property var minutes: "00"
    property var seconds: "00"
    property var timeOfDay: "AM"

    Process {
        id: dateProc
        command: ['date','+"%d %m %Y %H %M %S %p %a %A %b %B"']

        running: true

        stdout: SplitParser {
            onRead: data => {
                // Ex. Output: 
                // 01 01 2026 03 19 16 AM Thu Thursday Jan January
                let p = data.split(" ");

                day = p[0]
                month = p[1]
                year = p[2]

                hour = p[3]
                minutes = p[4]
                seconds = p[5]

                timeOfDay = p[6]
                
                dayName = p[7]
                dayShortName = p[8]

                monthName = p[9]
                monthShortName = p[10]
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