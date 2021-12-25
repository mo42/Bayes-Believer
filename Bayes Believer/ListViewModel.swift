//
//  ListViewModel.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import Foundation
import UIKit

class ListViewModel: ObservableObject {
  
  @Published var beliefs: [Belief] = [] {
    didSet {
      saveBeliefs()
    }
  }
  let beliefsKey: String = "beliefs_list"
  
  init() {
    getBeliefs()
  }

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

  func saveBeliefs() {
    if let encodedData = try? JSONEncoder().encode(beliefs) {
      UserDefaults.standard.set(encodedData, forKey: beliefsKey)
    }
  }

  func getBeliefs() {
    guard
      let data = UserDefaults.standard.data(forKey: beliefsKey),
      let savedItems = try? JSONDecoder().decode([Belief].self, from: data)
    else { return }
    self.beliefs = savedItems
  }
}
