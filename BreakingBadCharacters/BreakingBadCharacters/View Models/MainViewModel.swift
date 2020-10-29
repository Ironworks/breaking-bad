//
//  MainViewModel.swift
//  BreakingBadCharacters
//
//  Created by Trevor Doodes on 29/10/2020.
//

protocol MainViewProtocol: class {
    var model: [ Character]? { get set }
    
    func showAlert(message: String)
}

import Foundation

class MainViewModel {
    
    var networkClient: NetworkClientInterface
    weak var viewController: MainViewProtocol?
    
    init(networkClient: NetworkClientInterface, viewController: MainViewProtocol) {
        self.networkClient = networkClient
        self.viewController = viewController
    }
    
    func retrieveCharacters() {
        networkClient.getCharacters() { result in
            do {
                let characters = try result.decoded() as [Character]
                
                self.viewController?.model = characters
            } catch let error {
                self.viewController?.showAlert(message: error.localizedDescription)
            }
        }
    }
}
