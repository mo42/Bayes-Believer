//
//  BeliefUpdateView.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import SwiftUI

struct BeliefUpdateView: View {
  @State var belief: Belief
  @State var isEditing = false
  
  var body: some View {
    ScrollView {
      VStack {
        Text(belief.description)
          .multilineTextAlignment(.center)
        Divider()
        Text("Suppose this is false, how likely is it to observe evidence?")
          .multilineTextAlignment(.leading)
        HStack {
          TextField("", value: $belief.observationTrueLikelihood, formatter: NumberFormatter())
            .keyboardType(UIKeyboardType.decimalPad)
            .padding(.horizontal)
            .frame(width: 55, height: 55)
            .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
            .cornerRadius(10)
          Slider(value: $belief.observationTrueLikelihood,
                 in: 0.0...1.0,
                 onEditingChanged: { editing in
                    isEditing = editing
                 })
        }
        Divider()
        Text("Suppose this is false, how likely is it to observe evidence?")
          .multilineTextAlignment(.leading)
          .padding(0.0)
        HStack {
          TextField("", value: $belief.observationFalseLikelihood, formatter: NumberFormatter())
            .keyboardType(UIKeyboardType.decimalPad)
            .padding(.horizontal)
            .frame(width: 55, height: 55)
            .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
            .cornerRadius(10)
          Slider(value: $belief.observationFalseLikelihood,
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

struct BeliefUpdateView_Previews: PreviewProvider {
  static var belief = Belief(description: "Does got exist?", prior: 0.5, observationTrueLikelihood: 0.4, observationFalseLikelihood: 0.2)
  static var previews: some View {
    BeliefUpdateView(belief: belief)
  }
}
