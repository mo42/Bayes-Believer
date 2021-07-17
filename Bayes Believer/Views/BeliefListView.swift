//
//  ListView.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import SwiftUI

struct BeliefListView: View {
  
  @EnvironmentObject var listViewModel: ListViewModel
  
  var body: some View {
    List {
      ForEach(listViewModel.beliefs) { belief in
        BeliefView(belief: belief)
      }
      .onDelete(perform: listViewModel.deleteBelief)
      .onMove(perform: listViewModel.moveBelief)
    }
    .listStyle(PlainListStyle())
    .navigationTitle("Bayes Believer")
    .navigationBarItems(
      leading: EditButton(),
      trailing: NavigationLink("Add", destination: AddBeliefView()))
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      BeliefListView()
      }
      .preferredColorScheme(.dark)
      .environmentObject(ListViewModel())
  }
}
