//
//  HomeViewModelTest.swift
//  SimpleListExampleTests
//
//  Created by Umang on 04/08/23.
//

import XCTest
@testable import SimpleListExample

//    Resolved: Added more testcases
final class HomeViewModelTests: XCTestCase {
    
    let homeViewService = HomeViewService()
    
//    This function is to check wheather the peoplelist has data or not
    func test_peoplelist_is_not_empty() {
        let expectation = expectation(description: "get peoplelist api")
        NetworkManager.shared.baseURL = BaseUrl.stagging.url
        homeViewService.getPeoplesData(method: .get) { result in
            switch result {
            case .success(let peopleList):
                XCTAssertNotNil(peopleList)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNoThrow(error.localizedDescription)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
//    This function is to check wheather the peoplelist has api failure
    func test_peoplelist_api_failure() {
        let expectation = expectation(description: "get peoplelist api failure")
        NetworkManager.shared.baseURL = BaseUrl.testing.url
        homeViewService.getPeoplesData(method: .get) { result in
            switch result {
            case .success(let peopleList):
                XCTAssertNil(peopleList)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNoThrow(error.localizedDescription)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
//    This function is to check wheather the roomlist has data or not
    func test_roomlist_is_not_empty() {
        let expectation = expectation(description: "get roomlist api")
        NetworkManager.shared.baseURL = BaseUrl.stagging.url
        homeViewService.getRoomData(method: .get) { result in
            switch result {
            case .success(let roomlist):
                XCTAssertNotNil(roomlist)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNoThrow(error.localizedDescription)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    //    This function is to check wheather the roomlist has api failure
    func test_roomlist_api_failure() {
        let expectation = expectation(description: "get roomlist api failure")
        NetworkManager.shared.baseURL = BaseUrl.testing.url
        homeViewService.getRoomData(method: .get) { result in
            switch result {
            case .success(let roomlist):
                XCTAssertNil(roomlist)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNoThrow(error.localizedDescription)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
