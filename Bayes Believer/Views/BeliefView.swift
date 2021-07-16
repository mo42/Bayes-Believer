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
      BeliefItem(belief: belief)
      Spacer()
    }
  }
}

struct BeliefItem: View {
  let belief: Belief
  @EnvironmentObject var listViewModel: ListViewModel
  
  var body: some View {
    HStack(alignment: .lastTextBaseline) {
      Image(systemName: "circle.fill")
        .foregroundColor(.blue)
        .onTapGesture {
          let updatedBelief = belief.updateBelief(observation: true)
          listViewModel.updateBelief(belief: updatedBelief)
        }
      Image(systemName: "circle.fill")
        .foregroundColor(.red)
        .onTapGesture {
          let updatedBelief = belief.updateBelief(observation: false)
          listViewModel.updateBelief(belief: updatedBelief)
        }
      Text("\(belief.prior, specifier: "%.2f")")
        Text(belief.description)
          .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
          .lineLimit(1)
    }
  }
}
