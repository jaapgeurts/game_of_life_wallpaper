/*
 * Copyright (C) %{CURRENT_YEAR} by %{AUTHOR} <%{EMAIL}>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.8

// for "units"
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.kquickcontrols 2.0 as KQuickControls
import org.kde.plasma.core 2.0 as PlasmaCore


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
