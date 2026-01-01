pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower

Singleton {
    property var battery: UPower.devices.values.find(d => d.type === UPowerDeviceType.Battery)
}