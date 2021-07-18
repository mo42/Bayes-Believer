//
//  BeliefUpdateView.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import SwiftUI

struct BeliefUpdateView: View {
  
  let belief: Belief
  
  @State var isEditing = false
  
  var body: some View {
    ScrollView {
      VStack {
        LikelihoodUpdate(belief: belief, observation: true)
        Divider()
        LikelihoodUpdate(belief: belief, observation: false)
      }
      .padding(14.0)
      .navigationTitle("Update Belief")
    }
  }
  
  struct LikelihoodUpdate: View {
    let belief: Belief
    let observation: Bool
    let formatter: Formatter
    
    @State private var likelihood: Float
    @EnvironmentObject var listViewModel: ListViewModel
    
    init(belief: Belief, observation: Bool) {
      self.belief = belief
      self.observation = observation
      self.formatter = createFormatter()
      if (observation) {
        likelihood = belief.truePositive
      } else {
        likelihood = belief.falsePositive
      }
    }
    
    func updateLikelihood(likelihood: Float) {
      if(observation) {
        listViewModel.updateBelief(belief: belief.updateTruePositive(truePositive: likelihood))
      } else {
        listViewModel.updateBelief(belief: belief.updateFalsePositive(falsePositive: likelihood))
      }
    }
    
    var body: some View {
      let binding = Binding(
        get: { likelihood },
        set: { newLikelihood in
          likelihood = newLikelihood
          updateLikelihood(likelihood: newLikelihood)
        })
      Text(belief.description)
        .multilineTextAlignment(.center)
      Divider()
      if (observation) {
        Text("Suppose this is true, how likely is it to observe the evidence?")
          .multilineTextAlignment(.leading)
          .padding(0.0)
      } else {
        Text("Suppose this is false, how likely is it to observe the evidence?")
          .multilineTextAlignment(.leading)
          .padding(0.0)
      }
      HStack {
        TextField("", value: binding, formatter: formatter)
          .keyboardType(UIKeyboardType.decimalPad)
          .padding(.horizontal)
          .frame(width: 70, height: 55)
          .background(Color(UIColor.systemGray5))
          .cornerRadius(10)
        Slider(value: binding, in: 0.0...1.0)
      }
    }
  }
}

