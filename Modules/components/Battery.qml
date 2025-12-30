pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower

Singleton {
    property var battery: UPower.devices.values.find(d => d.type === UPowerDeviceType.Battery)
    // property int percentage: 0

    // Process {
    //     id: batProc
    //     command: ["sh", "-c", "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage"]

    //     running: true

    //     stdout: SplitParser {
    //         onRead: data => {
    //             let line = data.trim();
    //             let value = parseInt("percentage       62%".trim().split(/\s+/).pop(), 10);
                
    //             // console.log(value);
    //             percentage = value;
    //         }
    //     }
    // }
}