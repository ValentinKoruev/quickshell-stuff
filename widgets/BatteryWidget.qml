import QtQuick
import QtQuick.Layouts

import "../components"
import "../services"

Column {
    Layout.alignment: Qt.AlignHCenter
    
    CircleProgress {
        id: batCircle
        property var widgetColor: {
            let percentage = (Battery.battery?.percentage * 100).toFixed()

            if(percentage > 50) return "#0f0"

            if(percentage > 20) return "#ff0"

            return "#f00"
        }
        anchors.horizontalCenter: parent.horizontalCenter

        percent: (Battery.battery?.percentage * 100).toFixed() ?? 0

        backgroundColor: "#fff"
        progressColor: widgetColor
        width: 32
        height: 32
        lineWidth: 3

        showText: true
        textColor: "#fff"
        textSize: 10
        textBold: true
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: ""//
        font.pixelSize: 12
        color: batCircle.widgetColor
    }
}