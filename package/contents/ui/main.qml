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
 */


import QtQuick
import QtQuick.Layouts
import org.kde.plasma.plasmoid
import "code/life.js" as Life
import org.kde.plasma.core as PlasmaCore

WallpaperItem {
    id: root

    Canvas {
        id: gameCanvas
        anchors.fill: parent
        property int mleft: 0
        property int mtop: 0
        width: parent.width
        height: parent.height

        onPaint: {
            var ctx = getContext("2d");
            Life.paintMatrix(ctx,  wallpaper.configuration.cellColor, wallpaper.configuration.backgroundColor);
        }

        onWidthChanged: restartSimulation()
        onHeightChanged: restartSimulation()
    }

    Timer {
        id: stepTimer
        interval: wallpaper.configuration.updateTime
        repeat: true
        running: true
        triggeredOnStart: true

        onTriggered: {
            gameCanvas.mleft++;
            gameCanvas.mtop++;
            Life.advanceGeneration();
            gameCanvas.requestPaint();
        }
    }

    Connections {
        target: wallpaper.configuration

        function onCellSizeChanged() {
            restartSimulation()
        }
    }

    Component.onCompleted: {
        // Initialize the Life simulation using the actual dimensions
        Life.dimensionChanged(width, height, wallpaper.configuration.cellSize);
    }

    function restartSimulation() {
        stepTimer.stop()
        Life.dimensionChanged(gameCanvas.width, gameCanvas.height, wallpaper.configuration.cellSize)
        stepTimer.start()
        gameCanvas.requestPaint()
    }
}


