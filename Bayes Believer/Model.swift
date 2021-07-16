//
//  Model.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import Foundation

struct Belief: Identifiable {
  let id: String
  let description: String
  // base rate
  let prior: Float
  // True positive rate
  let truePositive: Float
  // False positive rate
  let falsePositive: Float
  
  init(id: String = UUID().uuidString, description: String, prior: Float,
       truePositive: Float = 0.5, falsePositive: Float = 0.5) {
    self.id = id
    self.description = description
    self.prior = prior
    self.truePositive = truePositive
    self.falsePositive = falsePositive
  }
  
  func updateBelief(observation: Bool) -> Belief {
    let prior = bayes(observation: observation, belief: self)
    return Belief(id: id, description: description, prior: prior,
                  truePositive: truePositive, falsePositive: falsePositive)
  }
  
  func updateTruePositive(truePositive: Float) -> Belief {
    return Belief(id: id, description: description, prior: prior,
                  truePositive: truePositive,
                  falsePositive: falsePositive)
  }
  
  func updateFalsePositive(falsePositive: Float) -> Belief {
    return Belief(id: id, description: description, prior: prior,
                  truePositive: truePositive,
                  falsePositive: falsePositive)
  }
}
