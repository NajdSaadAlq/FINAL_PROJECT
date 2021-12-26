//
//  PostCell.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 25/12/2021.
//

import UIKit


class PostCell: UITableViewCell {
    //MARK: OUTLETS

    @IBOutlet weak var likesNumberLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tagBackgroundSV: UIStackView!{
    didSet{tagBackgroundSV.layer.cornerRadius = 15}}
    @IBOutlet weak var postImageView: UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
