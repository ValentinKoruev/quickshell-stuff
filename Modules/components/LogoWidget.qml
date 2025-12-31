import QtQuick
import QtQuick.Layouts

Rectangle {
    width: parent.width

    color: primaryBg

    Layout.alignment: Qt.AlignHCenter

    Text {
        id: archLogo
        anchors.centerIn: parent
        text: "󰣇"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 22
        color: barScope.focused 
        Layout.alignment: Qt.AlignHCenter
    }

    height: archLogo.implicitHeight
}