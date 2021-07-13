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
