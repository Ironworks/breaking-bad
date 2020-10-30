//
//  DetailViewModel.swift
//  BreakingBadCharacters
//
//  Created by Trevor Doodes on 29/10/2020.
//

import Foundation

class DetailViewModel {
    
    var image: String
    var name: String
    var occupation: String
    var status: String
    var nickname: String
    var seasonAppearance: String
    
    init(character: Character) {
        self.image = character.img
        self.name = character.name
        self.occupation = character.occupation.joined(separator: ", ")
        self.status = character.status
        self.nickname = character.nickname
        if let appearance = character.appearance {
            self.seasonAppearance = appearance.map { String($0) }.joined(separator: ", ")
        } else {
            self.seasonAppearance = "No information available"
        }
       
    }
}
