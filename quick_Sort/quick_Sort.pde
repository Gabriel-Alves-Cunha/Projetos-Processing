int i = 0, w = 10;
public static float[] values;

void setup() {
  size(800, 200);
  values = new float[(floor(width/w))];

  for (int a = 0; a < values.length; a++) {
    values[a] = random(height);
  }
  frameRate(5);
  quickSort(values, 0, values.length-1);
}

void draw() {
  background(51);

  for (int a = 0; a < values.length; a++) {
    stroke(0);
    fill(255);
    rect(a*w, height-values[a], w, values[a]);
  }
}








void swap(float[] values, int a, int b) {
  float temp = values[a];
  values[a] = values[b];
  values[b] = temp;
} 

void quickSort(float[] values, int start, int end) {
  if (start >= end) {
    return;
  }

  int index = partition(values, start, end);

  quickSort(values, start, index-1);
  quickSort(values, index+1, end);
}

int partition(float[] values, int start, int end) {
  int pivotIndex = start;
  float pivotValue = values[end];
  for (int i = start; i < end; i++) {
    if (values[i] < pivotValue) {
      swap(values, i, pivotIndex);
      pivotIndex++;
    }
  }
  swap(values, pivotIndex, end);
  return pivotIndex;
}
