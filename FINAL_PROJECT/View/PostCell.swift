//
//  PostCell.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 25/12/2021.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.shadowColor = UIColor.black.cgColor
            backView.layer.shadowOpacity = 0.3
            backView.layer.shadowOffset = CGSize(width: 0, height: 2)
            backView.layer.shadowRadius = 5
            backView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
