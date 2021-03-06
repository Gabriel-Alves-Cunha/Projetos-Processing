class Perceptron {
  float[] weights;
  float lr = .1, bias = 1;;

  Perceptron(int n) {
     weights = new float[n];
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
  }
  
 

  //The Activation function
  int sign(float n) {
    if (n >= 0) {
      return 1;
    } else {
      return -1;
    }
  }

  int guess(float[] inputs) {
    float sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += inputs[i]*weights[i];
    }

    int output = sign(sum);

    return output;
  }

  void train(float[] inputs, int target) {
    int guess = guess(inputs), 
      error = target - guess;

    //Tune all the weights
    for (int i = 0; i < weights.length; i++) {
      weights[i] += error * inputs[i] * lr;
    }
  }
  
  float guessY(float x) {
    float w0 = weights[0],
    w1 = weights[1],
    w2 = weights[2];
    
    return -(w2/w1)*bias - (w0/w1)*x;  }
}
