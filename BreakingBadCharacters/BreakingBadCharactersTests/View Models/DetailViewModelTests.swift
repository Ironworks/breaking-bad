//
//  DetailViewModelTests.swift
//  BreakingBadCharactersTests
//
//  Created by Trevor Doodes on 29/10/2020.
//

import XCTest
@testable import BreakingBadCharacters

class DetailViewModelTests: XCTestCase {
    
    var sut: DetailViewModel!
    var expectedCharacter: Character!

    fileprivate func sutFromJson(file: String) {
        let bundle = Bundle(for: Self.self)
        expectedCharacter = bundle.decode(Character.self, from: file)
        sut = DetailViewModel(character: expectedCharacter)
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sutFromJson(file: "CharacterValid.json")
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_init_sets_image() {
        XCTAssertEqual(sut.image, expectedCharacter.img)
    }
    
    func test_init_sets_name() {
        XCTAssertEqual(sut.name, expectedCharacter.name)
    }
    
    func test_init_sets_occupation() {
        XCTAssertEqual(sut.occupation, "High School Chemistry Teacher, Meth King Pin")
    }
    
    func test_init_sets_status() {
        XCTAssertEqual(sut.status, expectedCharacter.status)
    }
    
    func test_init_sets_nickname() {
        XCTAssertEqual(sut.nickname, expectedCharacter.nickname)
    }
    
    func test_init_sets_appearances_when_avaialble() {
        XCTAssertEqual(sut.seasonAppearance, "1, 2, 3, 4, 5")
    }
    
    func test_init_sets_appearances_when_data_unavailable() {
        sutFromJson(file: "CharacterValidNoAppearance.json")
        
        XCTAssertEqual(sut.seasonAppearance, "No information available")
        
    }

}
