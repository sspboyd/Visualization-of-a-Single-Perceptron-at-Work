class Point {
  float x; 
  float y;
  int label;
  float bias=1;

  Point(float _x, float _y) {
    x=_x;
    y=_y;
  }

  Point() {
    x = random(-0.76, 1);
    y = random(-1, 1);
    float lineY = f(x);
    if (y> lineY) { 
      label = 1;
    } else {
      label = -1;
    }
  }

  float getPxlX() {
    return map(x, -1, 1, 0, width);
  }
  float getPxlY() {
    return map(y, -1, 1, height, 0);
  }

  void render() {
    stroke(29);
    if (label == 1) {
      strokeWeight(.5);
    } else {
      strokeWeight(.25);
    }
    noFill();
    float px = getPxlX();
    float py = getPxlY();
    ellipseMode(CENTER);
    ellipse(getPxlX(), getPxlY(), 18, 18);
  }
}
