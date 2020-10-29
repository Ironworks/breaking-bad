//
//  CharacterModel.swift
//  BreakingBadCharacters
//
//  Created by Trevor Doodes on 27/10/2020.
//

import Foundation

struct Character: Codable {
    let charId: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: String
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let category: String
    let betterCallSaulAppearance: [Int]
    
    
    enum CodingKeys: String, CodingKey {
        case charId = "char_id"
        case name
        case birthday
        case occupation
        case img
        case status
        case nickname
        case appearance
        case portrayed
        case category
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}
