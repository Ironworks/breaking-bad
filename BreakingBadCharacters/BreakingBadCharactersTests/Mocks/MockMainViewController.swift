//
//  MockMainViewController.swift
//  BreakingBadCharactersTests
//
//  Created by Trevor Doodes on 29/10/2020.
//

import Foundation
@testable import BreakingBadCharacters

class MockMainViewController: MainViewProtocol {
    var reloadDataCalled = false
    var showAlertCalled = false
    var message = ""
    
    var model: [Character]? {
        didSet {
            reloadData()
        }
    }
    
    func reloadData() {
        reloadDataCalled = true
    }
    
    func showAlert(message: String) {
        showAlertCalled = true
        self.message = message
    }
    
}
