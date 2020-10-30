//
//  MainCellViewModelTests.swift
//  BreakingBadCharactersTests
//
//  Created by Trevor Doodes on 29/10/2020.
//

import XCTest
@testable import BreakingBadCharacters

class MainCellViewModelTests: XCTestCase {
    
    var sut: MainCellViewModel!
    let expectedImage = "https://example.com"
    let expectedName = "Character Name"
    

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MainCellViewModel(image: expectedImage, name: expectedName)
        
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_init_sets_image_string() {
        XCTAssertEqual(sut.image, expectedImage)
    }
    
    func test_init_sets_character_name() {
        XCTAssertEqual(sut.name, expectedName)
    }
    
    
}
