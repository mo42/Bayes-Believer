//
//  ListViewModel.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import Foundation

class ListViewModel: ObservableObject {
  
  @Published var beliefs: [Belief] = []
  
  init() {
    // Test belief for developing
    beliefs.append(contentsOf: [Belief(description: "Belief", prior: 0.5, observationTrueLikelihood: 0.9, observationFalseLikelihood: 0.7)])
  }
  
  func deleteBelief(indexSet: IndexSet) {
    beliefs.remove(atOffsets: indexSet)
  }
  
  func moveBelief(from: IndexSet, to: Int) {
    beliefs.move(fromOffsets: from, toOffset: to)
  }
  
  func addBelief(description: String, prior: Float) {
    beliefs.append(Belief(description: description, prior: prior, observationTrueLikelihood: 0.0, observationFalseLikelihood: 0.0))
  }
  
  func updateBelief(observation: Bool) {
    
  }
}
