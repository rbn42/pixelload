import QtQuick 2.0
import QtQuick.Controls 2.0 as QQC2

import org.kde.kirigami 2.3 as Kirigami
import org.kde.kquickcontrols 2.0 as KQuickControls


Kirigami.FormLayout {

    property alias cfg_colorBackground: colorBackground.color
    KQuickControls.ColorButton {
        id: colorBackground
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "Background color")
    }

    property alias cfg_colorCpu0: colorCpu0.color
    KQuickControls.ColorButton {
        id: colorCpu0
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "CPU usage color0:")
    }
    property alias cfg_colorCpu1: colorCpu1.color
    KQuickControls.ColorButton {
        id: colorCpu1
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "CPU usage color1:")
    }
    property alias cfg_colorCpu2: colorCpu2.color
    KQuickControls.ColorButton {
        id: colorCpu2
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "CPU usage color2:")
    }
    property alias cfg_colorCpu3: colorCpu3.color
    KQuickControls.ColorButton {
        id: colorCpu3
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "CPU usage color3:")
    }

    property alias cfg_colorMem0: colorMem0.color
    KQuickControls.ColorButton {
        id: colorMem0
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "Memory usage:")
    }

    property alias cfg_colorNet0: colorNet0.color
    KQuickControls.ColorButton {
        id: colorNet0
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "Net uploading speed:")
    }
    property alias cfg_colorNet1: colorNet1.color
    KQuickControls.ColorButton {
        id: colorNet1
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "Net downloading speed:")
    }

    property alias cfg_colorDisk0: colorDisk0.color
    KQuickControls.ColorButton {
        id: colorDisk0
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "Disk writing speed:")
    }
    property alias cfg_colorDisk1: colorDisk1.color
    KQuickControls.ColorButton {
        id: colorDisk1
        showAlphaChannel:true
        Kirigami.FormData.label: i18nc("@label:chooser", "Disk reading speed:")
    }



}
