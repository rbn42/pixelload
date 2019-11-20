import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0 as QQC2

import org.kde.kirigami 2.3 as Kirigami

Kirigami.FormLayout {
    id:root

    anchors.right: parent.right
    anchors.left: parent.left


    property alias cfg_unitWidth: unitWidth.value
    property alias cfg_interval: interval.value

    QQC2.SpinBox {
        id: unitWidth

        Kirigami.FormData.label: i18nc("@label:spinbox", "Unit width:")
        editable:true
        stepSize:10

        from: 1
        to:800
    }

    QQC2.SpinBox {
        id: interval

        Kirigami.FormData.label: i18nc("@label:spinbox", "Interval:")
        editable:true
        stepSize:1

        from: 1
        to:100
    }
}
