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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let objectFactory = ObjectFactory()
        viewModel = objectFactory.mainViewModel(viewController: self)
        viewModel?.retrieveCharacters() 
    }
    

    func showAlert(message: String) {
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        let modelObject = model?[indexPath.row]
        cell.textLabel?.text = modelObject?.name
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

}
