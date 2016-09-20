# Linear Regression

This program will accept a CSV file path for a set of training data, and a pair of initial values for theta0 and theta1. The values of theta determine the hypothesis function, which is in the form h(x) = theta0 + theta1 * x.

 The "cost" method calculates the difference between the y-coordinate of the training data and the result of the hypothesis function for a given point.

The "learn" method uses the gradient of the cost function to find new values for theta0 and theta1. The result of the cost function should decrease after each application of the learn method.

Finally, "learn_cycle" manages a loop which executes "learn" until the difference between theta0 and theta1 before and after learn is smaller than some threshold value. 
