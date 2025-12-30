import "./"

CircleProgress {
    property var widgetColor: {
        let percentage = (Battery.battery.percentage * 100).toFixed()

        if(percentage > 50) return "#0f0"

        if(percentage > 20) return "#ff0"

        return "#f00"
    }
    anchors.horizontalCenter: parent.horizontalCenter

    percent: (Battery.battery.percentage * 100).toFixed()

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