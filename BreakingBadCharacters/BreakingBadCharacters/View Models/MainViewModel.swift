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

protocol MainViewModelInterface {
    func retrieveCharacters()
    func filteredContentForSearchText(_ searchText: String, searchIndex: Int)
}

class MainViewModel: MainViewModelInterface {
    
    var networkClient: NetworkClientInterface
    var model: [Character]?
    weak var viewController: MainViewProtocol?
    
    init(networkClient: NetworkClientInterface, viewController: MainViewProtocol) {
        self.networkClient = networkClient
        self.viewController = viewController
    }
    
    func retrieveCharacters() {
        networkClient.getCharacters() { result in
            do {
                let characters = try result.decoded() as [Character]
                self.model = characters
                self.viewController?.model = characters
            } catch let error {
                self.viewController?.showAlert(message: error.localizedDescription)
            }
        }
    }
    
    func filteredContentForSearchText(_ searchText: String, searchIndex: Int = 0)  {
        guard !searchText.isEmpty else {
            viewController?.model = model
            return
        }
        guard let model = model else { return }
        
        if searchIndex == 0 {
            self.viewController?.model = model.filter { (character: Character) -> Bool in
                return character.name.lowercased().contains(searchText.lowercased())
            }
        } else {
            self.viewController?.model = model.filter { (character: Character) -> Bool in
                
                guard let searchInt = Int(searchText) else { return false }
                guard let found = character.appearance?.contains(searchInt) else { return false}
                return found
                
            }
        }
    }
    
}
