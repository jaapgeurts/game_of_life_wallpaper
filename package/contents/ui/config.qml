import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

// for "units"
import org.kde.plasma.components as PlasmaComponents
import org.kde.kquickcontrols as KQuickControls
import org.kde.plasma.core as PlasmaCore


ColumnLayout {
    id: root

    property alias cfg_color : colorButton.color;

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        Label {
            anchors.verticalCenter: parent.verticalCenter
            rightPadding: 15
            text: i18n("Cell color")
        }
        KQuickControls.ColorButton {
            id: colorButton
            dialogTitle: i18n("Select cell color")
        }
    }
}
