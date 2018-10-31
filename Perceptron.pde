// This is the activation function
int sign(float num) {
  if (num>=0) {
    return 1;
  } else {
    return -1;
  }
}


class Perceptron {
  float[] weights = new float[2];
  float lR = 0.000025;
  //Constructor
  Perceptron() {
    // Init the weights randomly
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
      println(i + ": " + weights[i]);
    }
  } 

  int guess(float[] inputs) {
    float sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += inputs[i] * weights[i];
    }
    int output = sign(sum);
    return output;
  }

  void train(float[] inputs, int target) {
    // println("Starting weight: "+weights[0]+", " +weights[1]);
    int guess = guess(inputs);
    int error = target - guess;

    for (int i=0; i<weights.length; i++) {
      weights[i] += error * inputs[i] * lR;
    }
    // println("inputs: "+ inputs[0] + ", "+inputs[1]);
    // println("targets: "+ target);
    // println("Updated weight: "+weights[0]+", " +weights[1]);
  }
}
