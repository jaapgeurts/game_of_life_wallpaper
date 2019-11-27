/*
 * <one line to give the program's name and a brief idea of what it does.>
 * Copyright (C) 2019  Jaap Geurts <jaap.geurts@fontys.nl>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef GAMEOFLIFE_H
#define GAMEOFLIFE_H

#include <QObject>
#include <QTimer>
#include <QPainter>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickPaintedItem>

enum State { DEAD, ALIVE, DYING, SPAWNING };

/**
 * @todo write docs
 */
class GameOfLife : public QQuickPaintedItem
{
    Q_OBJECT

public:
    /**
     * Default constructor
     */
    GameOfLife(QQuickItem* parent = 0);
    ~GameOfLife();
    void paint(QPainter* painter) override;
    void geometryChanged(const QRectF &newGeometry, const QRectF &oldGeometry) override;

public slots:
    void step();
        
    
private:
    int getNeighbours(int x, int y);
    
    QTimer* timer;
    State* cells;
    State* cells_back;
    int cell_count_x = 0;
    int cell_count_y = 0;
    int SIZE = 10;
};

#endif // GAMEOFLIFE_H
