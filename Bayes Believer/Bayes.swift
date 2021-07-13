//
//  Bayes.swift
//  Bayes Believer
//
//  Created by Moritz on 13.07.21.
//

import Foundation

func bayes(observation: Bool, belief: Belief) -> Float {
  let normalization = belief.observationTrueLikelihood * belief.prior
    + belief.observationFalseLikelihood * (1 - belief.prior)
  if (observation) {
    return belief.observationTrueLikelihood * belief.prior / normalization
  } else {
    return belief.observationFalseLikelihood * (1 - belief.prior) / normalization
  }
}
