//
//  DetailViewController.swift
//  BreakingBadCharacters
//
//  Created by Trevor Doodes on 29/10/2020.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var appearanceLabel: UILabel!
    
    var viewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView() {
        navigationItem.title = viewModel?.name
        loadImage()
        occupationLabel.text = viewModel?.occupation
        statusLabel.text = viewModel?.status
        nicknameLabel.text = viewModel?.nickname
        appearanceLabel.text = viewModel?.seasonAppearance
    }
    
    private func loadImage() {
        guard let urlString = viewModel?.image,
            let imageURl = URL(string: urlString) else {
            return
        }
        
        characterImageView.kf.setImage(with: imageURl, placeholder: UIImage(named: "placeholder"))
    }

}
