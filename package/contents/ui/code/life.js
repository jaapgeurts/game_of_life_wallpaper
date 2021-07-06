
const State = {
    DEAD: 0,
    ALIVE: 1,
    DYING: 2,
    SPAWNING: 3,
}

var cell_count_x = 0;
var cell_count_y = 0;
var SIZE = 10;

var cells = [];
var cells_back = [];

function fillRandom() {
    for(let y=0;y<cell_count_y;y++) {
        for(let x=0;x<cell_count_x;x++) {
            let idx = y*cell_count_x+x;
            cells[idx] = Math.random() < 0.1 ? State.ALIVE : State.DEAD; // fill only 10%
            cells_back[idx] = State.DEAD;
        }
    }
}

function dimensionChanged(width,height) {
  cell_count_x = width / SIZE;
  cell_count_y = height / SIZE;
  fillRandom();
}

function getNeighbourCount( x, y)
{
    var sum = 0;
    // top
    y--;
    var idx = y*cell_count_x+x;
    if (cells[idx-1] == State.ALIVE)
        sum++;
    if (cells[idx] == State.ALIVE)
        sum++;
    if (cells[idx+1] == State.ALIVE)
        sum++;
    // middle
    idx += cell_count_x;
    if (cells[idx-1] == State.ALIVE)
        sum++;
    if (cells[idx+1] == State.ALIVE)
        sum++;
    // bottom
    idx += cell_count_x;
    if (cells[idx-1] == State.ALIVE)
        sum++;
    if (cells[idx] == State.ALIVE)
        sum++;
    if (cells[idx+1] == State.ALIVE)
        sum++;
    return sum;
}



function advanceGeneration() {
    for(let y=0;y<cell_count_y;y++){
        for(let x=0;x<cell_count_x;x++){
            let neighbours = getNeighbourCount(x,y);

            let idx = y*cell_count_x+x;

            if (neighbours < 2 && cells[idx] == State.ALIVE)
                cells_back[idx] = State.DEAD;
            else if (neighbours == 3 && cells[idx] == State.DEAD)
                cells_back[idx] = State.ALIVE;
            else if (neighbours > 3 && cells[idx] == State.ALIVE)
                cells_back[idx] = State.DEAD;
            else
                cells_back[idx] = cells[idx];
        }
    }
    // copy back into main matrix
    for(let y=0;y<cell_count_y;y++){
        for(let x=0;x<cell_count_x;x++){
            let idx = y*cell_count_x+x;
            cells[idx] = cells_back[idx];
        }
    }
}

function paintMatrix(ctx, color){
    for(let y=0;y<cell_count_y;y++){
        for(let x=0;x<cell_count_x;x++) {
            let idx = y*cell_count_x+x;
            if (cells[idx] == State.ALIVE) {
                ctx.fillStyle = color;
                ctx.fillRect(x*SIZE,y*SIZE,SIZE,SIZE);
            } else {
                ctx.fillStyle = "black";
                ctx.fillRect(x*SIZE,y*SIZE,SIZE,SIZE);
            }
        }
    }
}

