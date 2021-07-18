# Bayes-Believer
An iOS app that supports Bayesian thinking

Screenshot with *random* degrees of beliefs:
<img style="height:20%;" src="screen.png">

## Formal Background

Bayes' theorem describes how to infer beliefs based on observations and their likelihood (the rest is commentary 😉):

<img style="height:150%;" src="bayes.svg">

where B is the belief and D is the observational data.

This app is supposed to update beliefs iteratively.
There could be supporting observations several times and with varying true positive rates.
Therefore, we make beliefs time-dependent:

<img style="height:150%;" src="bayes_time.svg">

However, this allows only supporting observations.
To also support opposing observations, we use this formula:

<img style="height:150%;" src="bayes_neg.svg">

With both derivations, the app can generate a sequence of (refined) beliefs.
