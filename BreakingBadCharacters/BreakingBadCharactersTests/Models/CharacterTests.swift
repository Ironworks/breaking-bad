//
//  ChracterModelTests.swift
//  BreakingBadCharactersTests
//
//  Created by Trevor Doodes on 27/10/2020.
//

import XCTest
@testable import BreakingBadCharacters

class ChracterTests: XCTestCase {
    
    var sut: Character!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Character(
            charId: 1,
            name: expectedName,
            birthday: expectedBirthday,
            occupation: expectedOccupations,
            img: expectedImg,
            status: expectedStaus,
            nickname: expectedNickname,
            appearance: expectedAppearance,
            portrayed: expectedPortrayed,
            category: expectedCategory,
            betterCallSaulAppearance: expectedBetterCallSaulAppearance
        )
        
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        
    }
        
    func test_can_initialise_character_with_valid_data() {
        
        XCTAssertEqual(sut.charId, 1)
        XCTAssertEqual(sut.name, expectedName)
        XCTAssertEqual(sut.birthday, expectedBirthday)
        XCTAssertEqual(sut.occupation, expectedOccupations)
        XCTAssertEqual(sut.img, expectedImg)
        XCTAssertEqual(sut.status, expectedStaus)
        XCTAssertEqual(sut.nickname, expectedNickname)
        XCTAssertEqual(sut.appearance, expectedAppearance)
        XCTAssertEqual(sut.portrayed, expectedPortrayed)
        XCTAssertEqual(sut.category, expectedCategory)
        XCTAssertEqual(sut.betterCallSaulAppearance, expectedBetterCallSaulAppearance)
        
    }
    
    func test_can_initialise_character_with_valid_json () {
        
        let bundle = Bundle(for: Self.self)
        let character = bundle.decode(Character.self, from: "CharacterValid.json")
        
        XCTAssertEqual(character.charId, 1)
        XCTAssertEqual(character.name, expectedName)
        XCTAssertEqual(character.birthday, expectedBirthday)
        XCTAssertEqual(character.occupation, expectedOccupations)
        XCTAssertEqual(character.img, expectedImg)
        XCTAssertEqual(character.status, expectedStaus)
        XCTAssertEqual(character.nickname, expectedNickname)
        XCTAssertEqual(character.appearance, expectedAppearance)
        XCTAssertEqual(character.portrayed, expectedPortrayed)
        XCTAssertEqual(character.category, expectedCategory)
        XCTAssertEqual(character.betterCallSaulAppearance, expectedBetterCallSaulAppearance)
    }
}
