import QtQuick 2.0
import org.kde.kirigami 2.4 as Kirigami
import QtQuick.Controls 2.5 as QQC2
import org.kde.kquickcontrols 2.0 as KQControls

Kirigami.FormLayout {
    id: root
    twinFormLayouts: parentLayout

    property alias cfg_cellColor: cellColorButton.color
    property alias cfg_backgroundColor: backgroundColorButton.color
    property alias cfg_updateTime: updateTimeSpin.value
    property alias cfg_cellSize: cellSizeSpin.value

    KQControls.ColorButton {
        id: cellColorButton
        Kirigami.FormData.label: i18n("Cell color:")
        dialogTitle: i18n("Select cell color")
    }

    KQControls.ColorButton {
        id: backgroundColorButton
        Kirigami.FormData.label: i18n("Background color:")
        dialogTitle: i18n("Select background color")
    }

    QQC2.SpinBox {
        id: updateTimeSpin
        Kirigami.FormData.label: i18n("Update time (ms):")
        from: 1
        to: 60000
        stepSize: 10
        value: 1000
    }

    QQC2.SpinBox {
        id: cellSizeSpin
        Kirigami.FormData.label: i18n("Cell size:")
        from: 1
        to: 1000
        stepSize: 1
        value: 10
    }
}
