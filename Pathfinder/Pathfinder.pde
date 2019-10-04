import java.util.*;
int col = 5, row = 5, end;
Spot[][] grid = new Spot[col][row];
//int[] openSet, closedSet;
//Spot lugar = new Spot(i, j);

void setup() {
  size(640, 360);

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      grid[i][j] = new Spot(i, j);
    }
  }
}

int start = grid[0][0];
ArrayList<Integer> openSet = new ArrayList<Integer>(start), closedSet = new ArrayList<Integer>(end);

void draw() {

  if (openSet.size() > 0) {
    //We can keep going
  } else {
    //no solution
  }

  background(250);

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      grid[i][j].show(color(255));
    }
  }
}
