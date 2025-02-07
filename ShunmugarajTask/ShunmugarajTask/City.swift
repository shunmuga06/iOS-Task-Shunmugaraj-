//
//  City.swift
//  ShunmugarajTask
//
//  Created by Siddharth Shunmugaraj on 07/02/25.
//

// City Model
struct City: Identifiable, Decodable {
    var id: String { city }  // Use the city name as the ID
    let city: String
    let lat: String
    let lng: String
    let country: String
    let iso2: String
    let admin_name: String
    let capital: String
    let population: String
    let population_proper: String
}
