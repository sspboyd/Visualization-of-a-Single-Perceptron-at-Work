Perceptron ptrn;
Point[] points = new Point[500];
int trainingIdx = 0;
boolean done = false;

void setup() {
  size(600, 400);
  ptrn = new Perceptron(3);

  for (int i=0; i<points.length; i++) {
    points[i] = new Point();
  }
}

void draw() {
  done = true;
  background(199, 255, 255);
  strokeWeight(1);
  stroke(0);
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  stroke(199, 76, 47);
  line(p1.getPxlX(), p1.getPxlY(), p2.getPxlX(), p2.getPxlY());

  // Perceptron Current Guess
  Point pG1 = new Point(-1, ptrn.guessY(-1));
  Point pG2 = new Point(1, ptrn.guessY(1));
  stroke(0, 123, 199);
  line(pG1.getPxlX(), pG1.getPxlY(), pG2.getPxlX(), pG2.getPxlY());



  for (Point pt : points) {
    pt.render();
  }

  for (Point pt : points) {
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;
    int guess = ptrn.guess(inputs);
    if (guess == target) {
      fill(18, 199, 76);
    } else {
      done = false;
      fill(199, 29, 76);
    }
    noStroke();
    ellipse(pt.getPxlX(), pt.getPxlY(), 11, 11);
  }

  Point trnPt = points[trainingIdx];
  stroke(123);
  strokeWeight(3);
  line(trnPt.getPxlX(), trnPt.getPxlY(), 40, height/2);
  float[] inputs = {trnPt.x, trnPt.y, trnPt.bias};
  int target = trnPt.label;
  ptrn.train(inputs, target);
  trainingIdx++;
  if (trainingIdx == points.length) trainingIdx=0;

  float weightBarY1 = height/2;
  float scaleAbsMax = max(abs(ptrn.weights[0]), abs(ptrn.weights[1]), abs(ptrn.weights[2]))*2;
  float weightBarY2_0 = map(ptrn.weights[0], -scaleAbsMax, scaleAbsMax, height, 0);
  float weightBarY2_1 = map(ptrn.weights[1], -scaleAbsMax, scaleAbsMax, height, 0);
  float weightBarY2_2 = map(ptrn.weights[2], -scaleAbsMax, scaleAbsMax, height, 0);
  // println("weightBarY2: "+ weightBarY2);
  fill(255, 199);
  stroke(0, 123, 199);
  strokeWeight(3);
  ellipse(40, height/2, 80, 80);
  ellipseMode(CORNER);
  line(10, weightBarY1, 10, weightBarY2_0);
  line(14, weightBarY1, 14, weightBarY2_1);
  line(18, weightBarY1, 18, weightBarY2_2);
  noStroke();
  fill(0);
  text(ptrn.weights[0], 20, height/2);
  text(ptrn.weights[1], 20, height/2-textAscent()-5);
  text(ptrn.weights[2], 20, height/2+textAscent()*1+5);
  strokeWeight(1);
  ellipseMode(CENTER);

  if (done) noLoop();
}
