//
//  RepositoryCell.swift
//  Repositories
//
//  Created by Rajeev on 17/04/22.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var starGazersCountLabel: UILabel!
    
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var forksCountView: UIView!
    @IBOutlet weak var starGazersCountView: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: RepositoryCellViewModel) {
        self.ownerNameLabel.text = viewModel.ownerName
        self.nameLabel.text = viewModel.name
        self.descriptionLabel.text = viewModel.description
        self.languageView.isHidden = true
        self.forksCountView.isHidden = true
        self.starGazersCountView.isHidden = true

        if let language = viewModel.language {
            self.languageLabel.text = language
            self.languageView.isHidden = false
        }
        
        if let forksCount = viewModel.forksCount {
            self.forksCountLabel.text = String(forksCount)
            self.forksCountView.isHidden = false
        }
        
        if let starGazersCount = viewModel.starGazersCount {
            self.starGazersCountLabel.text = String(starGazersCount)
            self.starGazersCountView.isHidden = false
        }
    }
    
}
