class Point {
  float x; 
  float y;
  int label;

  Point() {
    x = random(width);
    y = random(height);

    if (x>y) { 
      label = 1;
    } else {
      label = -1;
    }
  }
  
  void render() {
    stroke(0);
    strokeWeight(1);
    if (label == 1) {
      strokeWeight(1);
    } else {
      strokeWeight(.25);
    }
    noFill();
    ellipse(x,y, 18,18);
  }
}
