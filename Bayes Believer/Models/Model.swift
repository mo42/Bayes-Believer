//
//  Model.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import Foundation

struct Belief: Identifiable {
  let id: String = UUID().uuidString
  let description: String
  // P(Observation|Data)
  var prior: Float
  // Likelihood function, i.e., P(Data|Observation)
  var observationTrueLikelihood: Float
  var observationFalseLikelihood: Float
}
