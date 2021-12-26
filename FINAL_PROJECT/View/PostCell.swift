//
//  PostCell.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 25/12/2021.
//

import UIKit


class PostCell: UITableViewCell {
    //MARK: OUTLETS

    @IBOutlet weak var userStackView: UIStackView!{
        didSet{userStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userStackViewTapped)))}}
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
    
    //MARK: ACTIONS
    @objc func userStackViewTapped(){
        NotificationCenter.default.post(name: Notification.Name("userStackViewTapped"), object: nil, userInfo: ["cell": self])
    }

}
