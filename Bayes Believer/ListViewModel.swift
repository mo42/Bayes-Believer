//
//  ListViewModel.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import Foundation

class ListViewModel: ObservableObject {
  
  @Published var beliefs: [Belief] = []
  
  func deleteBelief(indexSet: IndexSet) {
    beliefs.remove(atOffsets: indexSet)
  }
  
  func moveBelief(from: IndexSet, to: Int) {
    beliefs.move(fromOffsets: from, toOffset: to)
  }
  
  func addBelief(description: String, prior: Float) {
    beliefs.append(Belief(description: description, prior: prior))
  }
  
  func addBelief(belief: Belief) {
    beliefs.append(belief)
  }
  
  func updateBelief(belief: Belief) {
    if let index = beliefs.firstIndex(where: { $0.id == belief.id }) {
      beliefs[index] = belief
    }
  }
}

