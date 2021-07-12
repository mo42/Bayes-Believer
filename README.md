# Bayes-Believer
An iOS app that supports Bayesian thinking

## White Paper

Bayes' theorem describes how to infer beliefs based on observations and their likelihood:

<img style="height:150%;" src="https://render.githubusercontent.com/render/math?math=P(B|D)=\frac{P(D|B)P(B)}{P(D)}">,

where B is the belief and D is the observational data.
The likelihood function:
<img style="height:150%;" src="https://render.githubusercontent.com/render/math?math=P(D|B)"> is the unintuitive part of Bayes' theorem.
It describes the probability of observing the data given some belief.
For example, suppose a medical condition is already confirmed.
What is the probability that a test detects it?

When updating our belief the likelihood function needs to be set according to the type of observations (e.g., each medical test has its own likelihood function).
This app tires to provide an intuitive user interface for updating beliefs.
