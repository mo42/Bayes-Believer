//
//  AddBelief.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import SwiftUI

struct AddBeliefView: View {
  
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var listViewModel: ListViewModel
  
  @State private var textFieldText: String = ""
  @State private var prior: Float = 0.5
  @State private var isEditing = false
  
  var body: some View {
    ScrollView {
      VStack {
        TextField("Description of belief...", text: $textFieldText)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
          .cornerRadius(10)
          .lineLimit(nil)
        Divider()
        Text("How likely is this belief true?")
        HStack {
          TextField("", value: $prior, formatter: NumberFormatter())
            .keyboardType(UIKeyboardType.decimalPad)
            .padding(.horizontal)
            .frame(width: 55, height: 55)
            .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
            .cornerRadius(10)
          Slider(value: $prior,
                 in: 0.0...1.0,
                 onEditingChanged: { editing in
                    isEditing = editing
                 })
        }
        Divider()
        Button(action: saveButtonPressed, label: {
          Text("Save".uppercased())
            .foregroundColor(.white)
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10)
        })
      }
    }.padding(14)
    .navigationTitle("Add Belief")
  }
  
  func saveButtonPressed() {
    listViewModel.addBelief(description: textFieldText, prior: prior)
    presentationMode.wrappedValue.dismiss()
  }
}

struct AddBelief_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      AddBeliefView()
    }
    .environmentObject(ListViewModel())
  }
}
