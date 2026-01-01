import Quickshell
import QtQuick
import QtQuick.Layouts

import "../widgets"

Scope {
    id: barScope

    PanelWindow {
        id: bar
        anchors {
            top: true
            bottom: true
            left: true
        }

        implicitWidth: 50
        
        color: primaryBg

        // BarDebugLines {}

        ColumnLayout {
            id: layout
            anchors.fill: parent

            anchors.topMargin: 10
            anchors.bottomMargin: 10

            spacing: 10

            LogoWidget {}

            ClockWidget {}
            
            WorkspaceWidget {}

            BatteryWidget {}

            Item {
                Layout.fillHeight: true
            }

        }
    }
}