Perceptron ptrn;
Point[] points = new Point[1000];
int trainingIdx = 0;

void setup() {
  size(800, 800);
  ptrn = new Perceptron();

  for (int i=0; i<points.length; i++) {
    points[i] = new Point();
  }

  //float[] inputs = {-1, .5};
  //int guess = ptrn.guess(inputs);
  //println(guess);
  //frameRate(1);
}

void draw() {
  background(255);
  strokeWeight(1);
  stroke(0);
  line(0, 0, width, height);
  for (Point pt : points) {
    pt.render();
  }

  for (Point pt : points) {
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    // ptrn.train(inputs, target);

    int guess = ptrn.guess(inputs);
    if (guess == target) {
      fill(0, 200, 100,200);
    } else {
      fill(0, 100, 200,200);
    }
    noStroke();
    ellipse(pt.x, pt.y, 11, 11);
  }
  // fill(0, 0, 199, 199);
  text("Weights", 10, 10);
  float weightBarY1 = height/2;
  float scaleAbsMax = max(abs(ptrn.weights[0]), abs(ptrn.weights[1]))*2;
  float weightBarY2_0 = map(ptrn.weights[0], -scaleAbsMax, scaleAbsMax, height, 0);
  float weightBarY2_1 = map(ptrn.weights[1], -scaleAbsMax, scaleAbsMax, height, 0);
  // println("weightBarY2: "+ weightBarY2);
  strokeWeight(3);
  stroke(0);
  line(10, weightBarY1, 10, weightBarY2_0);
  line(14, weightBarY1, 14, weightBarY2_1);
  noStroke();
  fill(0);
  text(ptrn.weights[0], 20, height/2);
  text(ptrn.weights[1], 20, height/2+textAscent()+5);
  strokeWeight(1);

  Point trnPt = points[trainingIdx];
  float[] inputs = {trnPt.x, trnPt.y};
  int target = trnPt.label;
  ptrn.train(inputs, target);
  trainingIdx++;
  if (trainingIdx == points.length) trainingIdx=0;
}


void mousePressed() {
  for (Point pt : points) {
  }
}
