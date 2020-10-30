//
//  ObjectFactoryTests.swift
//  BreakingBadCharactersTests
//
//  Created by Trevor Doodes on 29/10/2020.
//

import XCTest
@testable import BreakingBadCharacters

class ObjectFactoryTests: XCTestCase {
    
    var sut: ObjectFactory!
    var mockViewController: MockMainViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockViewController = MockMainViewController()
        sut = ObjectFactory()
    }

    override func tearDownWithError() throws {
        mockViewController = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_can_create_mainViewModel() {
        let mainViewModel = sut.mainViewModel(viewController: mockViewController)

        XCTAssertNotNil(mainViewModel)
        XCTAssertNotNil(mainViewModel?.networkClient)
        XCTAssert(mainViewModel?.networkClient is NetworkClient)
        XCTAssertNotNil(mainViewModel?.viewController)
        XCTAssert(mainViewModel?.viewController is MockMainViewController)
    }
    
}
