//
//  HomeViewModelTest.swift
//  SimpleListExampleTests
//
//  Created by Umang on 04/08/23.
//

import XCTest
@testable import SimpleListExample

final class HomeViewModelTests: XCTestCase {
    
    let homeViewService = HomeViewService()
    
//    This function is to check wheather the peoplelist has data or not
    func test_peoplelist_is_not_empty() {
        let expectation = expectation(description: "get peoplelist api")
        homeViewService.getPeoplesData(method: .post) { result in
            switch result {
            case .success(let peopleList):
                XCTAssertNil(peopleList)
                expectation.fulfill()
            case .failure(let error):
                XCTAssert(false, "Geting error from api error is : \(error.localizedDescription)")
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
//    This function is to check wheather the roomlist has data or not
    func test_roomlist_is_not_empty() {
        let expectation = expectation(description: "get roomlist api")
        homeViewService.getRoomData(method: .post) { result in
            switch result {
            case .success(let roomlist):
                XCTAssertNotNil(roomlist)
                expectation.fulfill()
            case .failure(let error):
                XCTAssert(false, "Geting error from api error is : \(error.localizedDescription)")
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
