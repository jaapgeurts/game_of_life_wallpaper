import QtQuick 2.0
import org.kde.kirigami 2.4 as Kirigami
import org.kde.kquickcontrols 2.0 as KQControls

Kirigami.FormLayout {
    id: root
    twinFormLayouts: parentLayout

    property alias cfg_cellColor: cellColorButton.color
    property alias cfg_backgroundColor: backgroundColorButton.color

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
}
