//
//  ProfileVC.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 26/12/2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProfileVC: UIViewController {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!{
        didSet{profileImageView.makeCircularImage()}}
    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
        let appId = "61c0648055ad2a19a460d240"
        let URL = "https://dummyapi.io/data/v1/user/\(user.id)"
        let headers : HTTPHeaders = [
            "app-id" : appId ]
        
       // loaderView.startAnimating()
        //MARK: START requst Data
        // i changed it from responsrJSON To responseData because in Alamofire 6.0 they will delete responsrJSON
        AF.request(URL, headers: headers).responseData { response in
            let jsonData = JSON(response.value)
            let decoder = JSONDecoder()
            do{self.user = try decoder.decode(User.self, from: jsonData.rawData())
                self.setupUI()
            }
            catch let error{
                print(error)
            }
           // self.loaderView.stopAnimating()
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


