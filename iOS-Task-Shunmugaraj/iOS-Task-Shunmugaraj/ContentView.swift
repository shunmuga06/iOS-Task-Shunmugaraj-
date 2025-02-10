//
//  ContentView.swift
//  iOS-Task-Shunmugaraj
//
//  Created by Siddharth Shunmugaraj on 10/02/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CityViewModel(dataService: DataService())
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.citiesByState.keys.sorted(), id: \.self) { state in
                    Section(header: Text(state)) {
                        ForEach(viewModel.citiesByState[state] ?? [], id: \.id) { city in
                            Text(city.city)
                        }
                    }
                }
            }
            .listRowSpacing(10)
            .navigationTitle("Cities")
            .toolbar {
                Button("Reverse") {
                    viewModel.toggleListOrder()
                }
            }
            .onAppear {
                // Fetch data on appear for initial load
                viewModel.fetchCities()
            }
        }
        .preferredColorScheme(.dark) // Support dark mode
    }
}



//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

//#Preview {
//    ContentView()
//}
