# Bayes-Believer
An iOS app that supports Bayesian thinking

Screenshot with *random* degrees of beliefs:
![Screenshot](screen.png)

## Formal Background

Bayes' theorem describes how to infer beliefs based on observations and their likelihood (the rest is commentary 😉):

$P(B | D) = \frac{P(D | B) \cdot P(B)}{P(D)}$,

where B is the belief and D is the observational data.

This app is supposed to update beliefs iteratively.
There could be supporting observations several times and with varying true positive rates.
Therefore, we make beliefs time-dependent:

$P(B_{t+1} | D) = \frac{P(D | B_t) \cdot P(B_t | D)}{P(D)}$

However, this allows only supporting observations.
To also support opposing observations, we use this formula:

$P(B_{t+1} | \neg D) = \frac{P(\neg D | B_t) \cdot P(B_t | \neg D)}{P(\neg D)}$

With both derivations, the app can generate a sequence of (refined) beliefs.
