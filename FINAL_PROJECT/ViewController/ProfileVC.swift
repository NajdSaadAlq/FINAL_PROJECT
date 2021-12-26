//
//  ProfileVC.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 26/12/2021.
//

import UIKit
import NVActivityIndicatorView

class ProfileVC: UIViewController {
    
    var user: User!
    
    //MARK: OUTLETS
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!{
        didSet{profileImageView.makeCircularImage()}}
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: START viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loaderView.startAnimating()
        //MARK: START requst Data
        UserAPI.getUserData(id: user.id) { userResponse in
            self.user = userResponse
            self.loaderView.stopAnimating()
            self.setupUI()
        }//MARK: END requst Data
    }//MARK: END viewDidLoad
    func setupUI(){
        nameLabel.text = user.firstName + " " + user.lastName
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        genderLabel.text = user.gender
        if let location = user.location{
            countryLabel.text = location.country! + " - " + location.city!
        }
        profileImageView.setImageFromStringUrl(stringUrl: user.picture)
    }
}//MARK: END CLASS


