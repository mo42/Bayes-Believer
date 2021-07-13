//
//  BeliefBar.swift
//  Bayes Believer
//
//  Created by Moritz on 11.07.21.
//

import SwiftUI

struct BeliefBar: View {
  let height: Double
  let color: Color
                       
  var body: some View {
      RoundedRectangle(cornerRadius: 5)
          .fill(color)
          .scaleEffect(CGSize(width: 1, height: height), anchor: .bottom)
  }
}
