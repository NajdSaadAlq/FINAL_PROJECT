//
//  User.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 25/12/2021.
//

import Foundation
import UIKit

struct User : Decodable{
    var id: String
    var firstName: String
    var lastName: String
    var picture: String
    var gender: String?
    var email: String?
    var phone: String?
    var location: Location?
}
