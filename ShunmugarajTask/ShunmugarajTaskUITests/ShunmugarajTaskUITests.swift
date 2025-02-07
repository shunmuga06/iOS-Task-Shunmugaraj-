//
//  ShunmugarajTaskUITests.swift
//  ShunmugarajTaskUITests
//
//  Created by Siddharth Shunmugaraj on 07/02/25.
//

import XCTest
import Combine
@testable import ShunmugarajTask

final class ShunmugarajTaskUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

class CityViewModelTests: XCTestCase {
    var viewModel: CityViewModel!
    var dataServiceMock: DataServiceMock!
    
    override func setUp() {
        super.setUp()
        dataServiceMock = DataServiceMock()
        viewModel = CityViewModel(dataService: dataServiceMock)
    }

    override func tearDown() {
        viewModel = nil
        dataServiceMock = nil
        super.tearDown()
    }
    
    func testFetchCities() {
        let cities = [City(city: "Sydney", lat: "-33.8678", lng: "151.2100", country: "Australia", iso2: "AU", admin_name: "New South Wales", capital: "admin", population: "4840600", population_proper: "4840600")]
        
        dataServiceMock.cities = cities
        
        let expectation = self.expectation(description: "Data fetched")
        
        viewModel.$citiesByState
            .dropFirst() // Ignore the initial state
            .sink { _ in
                XCTAssertEqual(self.viewModel.citiesByState.count, 1)
                expectation.fulfill()
            }
            .store(in: &viewModel.cancellables)
        
        viewModel.fetchCities()
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}

// Mock Data Service for Unit Testing
class DataServiceMock: DataService {
    var cities: [City] = []
    
    override func fetchCities() -> AnyPublisher<[City], Error> {
        return Just(cities)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
