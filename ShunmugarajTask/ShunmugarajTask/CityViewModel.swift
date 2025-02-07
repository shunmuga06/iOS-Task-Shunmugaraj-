//
//  CityViewModel.swift
//  ShunmugarajTask
//
//  Created by Siddharth Shunmugaraj on 07/02/25.
//

import Foundation
import Combine

// CityViewModel for handling data
class CityViewModel: ObservableObject {
    @Published var citiesByState: [String: [City]] = [:]
    @Published var isListReversed: Bool = false
    private var cities: [City] = []
    
    // Dependency Injection for fetching data
    private let dataService: DataService
    public var cancellables = Set<AnyCancellable>()
    
    init(dataService: DataService) {
        self.dataService = dataService
        fetchCities()
    }
    
    // Fetch cities from backend or cache
    func fetchCities() {
        dataService.fetchCities()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching data: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] cities in
                self?.cities = cities
                self?.groupCitiesByState()
            }
            .store(in: &cancellables)
    }
    
    // Group cities by their state (admin_name)
    func groupCitiesByState() {
        let grouped = Dictionary(grouping: cities, by: { $0.admin_name })
        citiesByState = grouped
        
        if isListReversed {
            citiesByState = citiesByState.mapValues { $0.reversed() }
        }
    }
    
    // Toggle list order
    func toggleListOrder() {
        isListReversed.toggle()
        groupCitiesByState()
    }
}
