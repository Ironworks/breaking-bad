//
//  ObjectFactory.swift
//  BreakingBadCharacters
//
//  Created by Trevor Doodes on 29/10/2020.
//

import Foundation
import UIKit

protocol ObjectFactoryInterface {
    func networkClient() -> NetworkClient?
    func mainViewModel(viewController: MainViewProtocol) -> MainViewModel?
}


class ObjectFactory: ObjectFactoryInterface {
    
    private let baseURLString = "https://breakingbadapi.com/"
    
    func networkClient() -> NetworkClient? {
        guard let url = URL(string: baseURLString) else { return nil }
        
        return NetworkClient(baseURL: url, session: URLSession.shared)
    }
    
    func mainViewModel(viewController: MainViewProtocol) -> MainViewModel? {
        
        guard let networkClient = networkClient() else {
            return nil
        }
        let viewModel = MainViewModel(networkClient: networkClient, viewController: viewController)
        
        return viewModel
    }
    
}
