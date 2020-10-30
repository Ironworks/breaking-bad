//
//  MainViewControllerTests.swift
//  BreakingBadCharactersTests
//
//  Created by Trevor Doodes on 30/10/2020.
//

import XCTest
@testable import BreakingBadCharacters

class MainViewControllerTests: XCTestCase {

    var sut: MainViewController!
    var mockViewModel: MockMainViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        sut = storyboard.instantiateViewController(identifier: "MainViewController")
        mockViewModel = MockMainViewModel()
        sut.viewModel = mockViewModel
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_can_call_retrieveCharacters_on_the_viewModel() {
        sut.retrieveCharacters()
        XCTAssertEqual(mockViewModel.retrieveCharactersCalled, true)
    }
    
    func test_can_call_filterContent_on_view_Model() {
        let searchController = UISearchController()
        searchController.searchBar.text = "search"
        sut.updateSearchResults(for: searchController)
        
        XCTAssertEqual(mockViewModel.filteredContectCalled, true)
        XCTAssertEqual(mockViewModel.searchText, "search")
        XCTAssertEqual(mockViewModel.searchIndex, 0)
    }
}

class MockMainViewModel: MainViewModelInterface {
    
    var retrieveCharactersCalled = false
    var filteredContectCalled = false
    var searchText = ""
    var searchIndex = -1
    
    func retrieveCharacters() {
        retrieveCharactersCalled = true
    }
    
    func filteredContentForSearchText(_ searchText: String, searchIndex: Int) {
        filteredContectCalled = true
        self.searchText = searchText
        self.searchIndex = searchIndex
    }
    
    
    
    
}
