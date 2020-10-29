//
//  MainTableViewCell.swift
//  BreakingBadCharacters
//
//  Created by Trevor Doodes on 29/10/2020.
//
import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func prepareForReuse() {
        characterImageView.image = nil
        characterNameLabel.text = ""
    }
    
    func configure(data: MainCellViewModel) {
        
        characterNameLabel.text = data.name
        guard let imageURl = URL(string: data.image) else {
            return
        }
        
        characterImageView.kf.setImage(with: imageURl, placeholder: UIImage(named: "placeholder"))
    }

}
