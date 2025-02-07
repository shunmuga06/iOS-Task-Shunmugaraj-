//
//  ShunmugarajTaskApp.swift
//  ShunmugarajTask
//
//  Created by Siddharth Shunmugaraj on 07/02/25.
//

import SwiftUI

@main
struct ShunmugarajTaskApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ContentView(viewModel:CityViewModel(dataService: DataService()))
        }
    }
}
