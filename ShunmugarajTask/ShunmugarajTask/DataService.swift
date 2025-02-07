//
//  DataService.swift
//  ShunmugarajTask
//
//  Created by Siddharth Shunmugaraj on 07/02/25.
//

import Foundation
import Combine

// DataService handles data fetching and caching
class DataService {
    
    private var cachedCities: [City]?
    
    // Fetch data from a remote server or cache if available
    func fetchCities() -> AnyPublisher<[City], Error> {
        if let cachedCities = cachedCities {
            return Just(cachedCities)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        // Convert the JSON string to Data
          guard let data = citiesData.data(using: .utf8) else {
              return Fail(error: NSError(domain: "InvalidData", code: 100, userInfo: nil))
                  .eraseToAnyPublisher()
          }
          
          // Decode the JSON data into City models
          let decoder = JSONDecoder()
          return Just(data)
              .decode(type: [City].self, decoder: decoder)
              .handleEvents(receiveOutput: { [weak self] cities in
                  self?.cachedCities = cities // Cache the data
              })
              .eraseToAnyPublisher()
      }
        //        // Fetch data from API (use your own API URL here)
        //        let url = URL(string: "https://simplemaps.com/data/au-cities.json")!
        //        return URLSession.shared.dataTaskPublisher(for: url)
        //            .map { $0.data }
        //            .decode(type: [City].self, decoder: JSONDecoder())
        //            .handleEvents(receiveOutput: { [weak self] cities in
        //                self?.cachedCities = cities // Cache the data
        //            })
        //            .eraseToAnyPublisher()
}
