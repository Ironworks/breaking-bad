//
//  NetworkClient.swift
//  BreakingBadCharacters
//
//  Created by Trevor Doodes on 28/10/2020.
//

import Foundation

class NetworkClient {
    
    let baseURL: URL
    let session: URLResultSession
    
    init(baseURL: URL, session: URLResultSession) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func getCharacters(completionHandler: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: "api/characters", relativeTo: baseURL) else {return}
        let task = session.dataTask(with: url) { result in
            switch result {
            case .success((_, let data)):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
    
}



