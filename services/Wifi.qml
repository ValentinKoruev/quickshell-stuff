pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {

    property var currentConnection: null
    property bool refreshing: false

    ListModel {
        id: connections
    }

    ListModel {
        id: newConnections
    }

    function refresh() {
        if(refreshing) return;

        wifiProc.running = true
    }

    function getSignalIcon(signal) {

        if(!signal) return "󰤭"

        if(signal > 80) return "󰤨"
        
        if(signal > 60) return "󰤥"
        
        if(signal > 40) return "󰤢"
        
        if(signal > 20) return "󰤟"

        return "󰤯"
    }

    function getCurrentConnectionSignalIcon() {
        return getSignalIcon(currentConnection?.signal)
    }

    function getConnections() {
        return connections;
    }

    Process {
        id: wifiProc
        command: ["nmcli", "-t", "-f", "IN-USE,SSID,SIGNAL", "device", "wifi", "list", "--rescan", "yes"]

        running: true

        stdout: SplitParser {
            onRead: data => {
                const p = data.trim().split(":");

                if(p[0] === "*") {
                    currentConnection = {name: p[1], signal: p[2]}
                    return;
                }

                newConnections.append({name: p[1], signal: p[2]});
            }
        }

        onStarted: {
            refreshing = true
            wifiTimer.restart()
            console.log('start')
        }

        onExited: {
            
            console.log('updating list')
            connections.clear()
            for (let i = 0; i < newConnections.count; i++) {
                let item = newConnections.get(i)
                connections.append(item)  // appends a copy of the object
            }

            newConnections.clear()
            refreshing = false
            console.log('exit')
        }
    }

    Timer {
        id: wifiTimer
        interval: 30000
        repeat: true
        running: true
        onTriggered: refresh()
    }
}