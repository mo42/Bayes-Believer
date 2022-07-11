//
//  Utils.swift
//  Bayes Believer
//
//  Created by Moritz on 13.07.21.
//

import Foundation

func createFormatter() -> Formatter {
  let formatter = NumberFormatter()
  formatter.numberStyle = .decimal
  formatter.maximumFractionDigits = 2
  return formatter
}

func bayes(observation: Bool, belief: Belief) -> Float {
  if (observation) {
    let numerator = belief.prior * belief.truePositive
    let denominator = numerator + (1 - belief.prior) * belief.falsePositive
    return numerator / denominator
  } else {
    let numerator = belief.prior * belief.falsePositive
    let denominator = numerator + (1 - belief.prior) * (1 - belief.falsePositive)
    return numerator / denominator
  }
}
