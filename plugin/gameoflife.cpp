/*
 * KDE Plasma Conway's game of life active wall paper
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
#include <QBrush>
#include <cstdlib>
#include "gameoflife.h"

GameOfLife::GameOfLife(QQuickItem* parent) : QQuickPaintedItem(parent)
{


    timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &GameOfLife::step);

}

GameOfLife::~GameOfLife()
{
    delete cells;
    delete cells_back;
}

void GameOfLife::geometryChanged(const QRectF &newGeometry, const QRectF &oldGeometry)
{
    timer->stop();

    // reallocate the array
    cell_count_x = newGeometry.width() / SIZE;
    cell_count_y = newGeometry.height() / SIZE;

    cells = new State[cell_count_x * cell_count_y];
    cells_back = new State[cell_count_x * cell_count_y];

    for(int j=0; j<cell_count_y; j++) {
        for(int i=0; i<cell_count_x; i++) {
            cells[j*cell_count_x+i] = rand() % 5 == 1 ? ALIVE : DEAD;
            cells_back[j*cell_count_x+i] = DEAD;
        }
    }
    timer->start(200);
}

void GameOfLife::step()
{
    for(int j=1; j<cell_count_y-1; j++)
    {
        for(int i=1; i<cell_count_x-1; i++)
        {

            int neighbours = getNeighbours(i,j);

            if (neighbours < 2 && cells[j*cell_count_x+i] == ALIVE)
                cells_back[j*cell_count_x+i] = DEAD;
            else if (neighbours == 3 && cells[j*cell_count_x+i] == DEAD)
                cells_back[j*cell_count_x+i] = ALIVE;
            else if (neighbours > 3 && cells[j*cell_count_x+i] == ALIVE)
                cells_back[j*cell_count_x+i] = DEAD;
            else
                cells_back[j*cell_count_x+i] = cells[j*cell_count_x+i];

        }
    }

    for(int j=1; j<cell_count_y-1; j++)
    {
        for(int i=1; i<cell_count_x-1; i++)
        {
            cells[j*cell_count_x+i] = cells_back[j*cell_count_x+i];
        }
    }

    update();
}

int GameOfLife::getNeighbours(int x, int y)
{
    int sum = 0;
    y--;
    if (cells[y*cell_count_x+x-1] == ALIVE)
        sum++;
    if (cells[y*cell_count_x+x] == ALIVE)
        sum++;
    if (cells[y*cell_count_x+x+1] == ALIVE)
        sum++;
    y++;
    if (cells[y*cell_count_x+x-1] == ALIVE)
        sum++;
    if (cells[y*cell_count_x+x+1] == ALIVE)
        sum++;
    y++;
    if (cells[y*cell_count_x+x-1] == ALIVE)
        sum++;
    if (cells[y*cell_count_x+x] == ALIVE)
        sum++;
    if (cells[y*cell_count_x+x+1] == ALIVE)
        sum++;
    return sum;
}

void GameOfLife::paint(QPainter* painter)
{
    QBrush brush(Qt::green);

    painter->setBrush(brush);
    painter->setPen(Qt::green);

    for (int y=0; y<cell_count_y-1; y++) {
        for (int x=0; x<cell_count_x-1; x++) {
            if (cells[y*cell_count_x+x] == ALIVE)
                painter->fillRect(x*SIZE, y*SIZE,SIZE,SIZE, brush);

        }
    }
}

