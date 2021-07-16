//
//  BeliefUpdateView.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import SwiftUI

struct BeliefUpdateView: View {
  
  let belief: Belief
  @EnvironmentObject var listViewModel: ListViewModel
  @State var isEditing = false
  @State private var truePositive: Float
  @State private var falsePositive: Float
  
  init(belief: Belief) {
    self.belief = belief
    truePositive = belief.truePositive
    falsePositive = belief.falsePositive
  }
  
  let formatter = createFormatter()
  
  var body: some View {
    ScrollView {
      VStack {
        Text(belief.description)
          .multilineTextAlignment(.center)
        Divider()
        Text("Suppose this is true, how likely is it to observe the evidence?")
          .multilineTextAlignment(.leading)
          .padding(0.0)
        HStack {
          TextField("", value: Binding(get: {
            truePositive
          }, set: { newTruePositive in
            truePositive = newTruePositive
            listViewModel.updateBelief(belief: belief.updateTruePositive(truePositive: newTruePositive))
          }), formatter: formatter)
            .keyboardType(UIKeyboardType.decimalPad)
            .padding(.horizontal)
            .frame(width: 70, height: 55)
            .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
            .cornerRadius(10)
          Slider(value: Binding(get: {
            truePositive
          }, set: { newTruePositive in
            truePositive = newTruePositive
            listViewModel.updateBelief(belief: belief.updateTruePositive(truePositive: newTruePositive))
          }),
                 in: 0.0...1.0,
                 onEditingChanged: { editing in
                    isEditing = editing
                 })
        }
        Divider()
        Text("Suppose this is false, how likely is it to observe the evidence?")
          .multilineTextAlignment(.leading)
          .padding(0.0)
        HStack {
          TextField("", value: Binding(get: {
            falsePositive
          }, set: { newObservationFalseLikelihood in
            falsePositive = newObservationFalseLikelihood
            listViewModel.updateBelief(belief: belief.updateFalsePositive(falsePositive: newObservationFalseLikelihood))
          }), formatter: formatter)
            .keyboardType(UIKeyboardType.decimalPad)
            .padding(.horizontal)
            .frame(width: 70, height: 55)
            .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
            .cornerRadius(10)
          Slider(value: Binding(get: {
            falsePositive
          }, set: { newObservationFalseLikelihood in
            falsePositive = newObservationFalseLikelihood
            listViewModel.updateBelief(belief: belief.updateFalsePositive(falsePositive: newObservationFalseLikelihood))
          }),
                 in: 0.0...1.0,
                 onEditingChanged: { editing in
                    isEditing = editing
                 })
        }
      }
    }
    .padding(14.0)
    .navigationTitle("Update Belief")
  }
}

