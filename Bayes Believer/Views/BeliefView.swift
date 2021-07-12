//
//  ListRowView.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import SwiftUI

struct BeliefView: View {
  
  let belief: Belief
  
  var body: some View {
      NavigationLink(destination: BeliefUpdateView(belief: belief)) {
        HStack {
          Text("\(belief.prior, specifier: "%.2f")")
          Text(belief.description).lineLimit(1)
        }
        Spacer()
      }
    }
}

struct ListRowView_Previews: PreviewProvider {
  static var belief = Belief(description: "Does god exist?", prior: 0.5, observationTrueLikelihood: 0.0, observationFalseLikelihood: 0.0)
  static var previews: some View {
    BeliefView(belief: belief)
  }
}
