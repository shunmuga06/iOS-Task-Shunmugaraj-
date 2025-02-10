//
//  iOS_Task_ShunmugarajApp.swift
//  iOS-Task-Shunmugaraj
//
//  Created by Siddharth Shunmugaraj on 10/02/25.
//

import SwiftUI

@main
struct iOS_Task_ShunmugarajApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ContentView(viewModel:CityViewModel(dataService: DataService()))
        }
    }
}
