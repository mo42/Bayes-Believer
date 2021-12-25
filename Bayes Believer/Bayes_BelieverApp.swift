//
//  Bayes_BelieverApp.swift
//  Bayes Believer
//
//  Created by Moritz on 09.07.21.
//

import SwiftUI

@main
struct Bayes_BelieverApp: App {

    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BeliefListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
