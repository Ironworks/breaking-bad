//
//  NetworkClientTests.swift
//  BreakingBadCharactersTests
//
//  Created by Trevor Doodes on 28/10/2020.
//

@testable import BreakingBadCharacters
import XCTest

class NetworkClientTests: XCTestCase {
    
    var sut: NetworkClient!
    var baseURL: URL!
    var mockSession: MockURLSession!

    override func setUpWithError() throws {
        try super.setUpWithError()
        baseURL = URL(string: "https://example.com/")!
        mockSession = MockURLSession()
        sut = NetworkClient(baseURL: baseURL, session: mockSession)
    }

    override func tearDownWithError() throws {
        baseURL = nil
        mockSession = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    
    func test_init_sets_baseURL() {
        XCTAssertEqual(sut.baseURL, baseURL)
    }
    
    func test_init_sets_session() {
        XCTAssertTrue(sut.session is MockURLSession)
    }
    
    func test_getCharacters_sets_url_correctly() {
        let url = URL(string: "api/characters", relativeTo: baseURL)
        
        sut.getCharacters() { _ in }
        
        XCTAssertEqual(mockSession.url, url)
    }
    
    func test_getCharacters_fails_on_error () {
        
        sut.getCharacters() { result in
            
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (error error 0.)")
            }
        }
    }
    
    func test_getCharacters_fails_on_invalid_Json () {
        mockSession.returnData = true
        mockSession.dataFilename = "CharactersInvalid"
        
        sut.getCharacters() { result in
            
            do {
                _ = try result.decoded() as [Character]
            } catch let e {
                XCTAssertEqual(e.localizedDescription, "The data couldn’t be read because it isn’t in the correct format.")
            }
        }
    }
    
    func test_getCharacters_returns_characters_with_valid_json() throws {
        
        mockSession.returnData = true
        mockSession.dataFilename = "CharactersValid"
        
        sut.getCharacters() { result in
            do {
                let data = try result.decoded() as [Character]
                
                XCTAssertEqual(data.count, 3)
                
                let character = data[0]
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
                
            } catch {
                XCTFail("Data not loaded")
            }
        }
    }

}

class MockURLSession: URLResultSession {
    
    var url = URL(string: "")
    var dataTask: URLSessionDataTask!
    var returnData = false
    var dataFilename = ""
    
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        self.url = url
        dataTask = MockURLSessionDataTask(with: url, result: result)
        if let task = dataTask as? MockURLSessionDataTask {
            task.returnData = returnData
            task.dataFilename = dataFilename
        }
        return dataTask
    }
    
}

class MockURLSessionDataTask: URLSessionDataTask {

    var completionHandler: (Result<(URLResponse, Data), Error>) -> Void
    var url: URL
    var returnData = false
    var dataFilename = ""
    
    init(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) {
        self.url = url
        self.completionHandler = result
    }
    
    override func resume() {
        if returnData {
           returnValues()
        } else {
            returnError()
        }
        
    }
    
    private func returnError() {
        let error = NSError(domain: "error", code: 0, userInfo: nil)
        completionHandler(.failure(error))
    }
    
    private func returnValues() {
        let response = URLResponse()
        
        do {
            let data = try Data.fromJSON(fileName: dataFilename)
            completionHandler(.success((response, data)))
        } catch {
            XCTFail("Failed to load data")
        }
    }
    
}
