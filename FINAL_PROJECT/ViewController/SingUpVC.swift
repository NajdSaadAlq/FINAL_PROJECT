//
//  SingUpVC.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 26/12/2021.
//

import UIKit

class SingUpVC: UIViewController {
    //MARK: OUTLETS
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    //MARK: LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: ACTION

    @IBAction func signUpClicked(_ sender: Any) {
        UserAPI.SingUpNewUser { user in
            print(user)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
