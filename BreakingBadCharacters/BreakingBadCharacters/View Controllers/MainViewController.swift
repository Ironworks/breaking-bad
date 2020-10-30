//
//  MainViewController.swift
//  BreakingBadCharacters
//
//  Created by Trevor Doodes on 29/10/2020.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var model: [Character]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var viewModel: MainViewModel?
    
    var filteredModel: [Character] = []
        
    let searchController = UISearchController(searchResultsController: nil)
    
    private var scopeButtonIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Character List"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 162
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search term"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = ["Name", "Season"]
        searchController.searchBar.delegate = self

        let objectFactory = ObjectFactory()
        viewModel = objectFactory.mainViewModel(viewController: self)
        viewModel?.retrieveCharacters() 
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if let cell = sender as? UITableViewCell,
           let row = self.tableView.indexPath(for: cell)?.row,
           let character = model?[row] {
            
            let detailViewModel = DetailViewModel(character: character)
            
            if segue.identifier == "ShowDetail" {
                let vc = segue.destination as! DetailViewController
                vc.viewModel = detailViewModel
            }
        }
    }
    
    
    func showAlert(message: String) {
        
    }
    
 
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModel?.filteredContentForSearchText(searchBar.text!, searchIndex: scopeButtonIndex)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        scopeButtonIndex = selectedScope
        searchBar.text = ""
//        if scopeButtonIndex == 0 {
//            viewModel?.filteredContentForSearchText("")
//        } else {
//            viewModel?.filteredContentForSearchText(searchBar.text!, searchIndex: scopeButtonIndex)
//        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    private func mainCellViewModel(from character: Character) -> MainCellViewModel {
        return MainCellViewModel(image: character.img, name: character.name)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! MainTableViewCell
        
        guard let modelObject = model?[indexPath.row] else { return UITableViewCell() }
 
        cell.configure(data: mainCellViewModel(from: modelObject))
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162
    }
}
