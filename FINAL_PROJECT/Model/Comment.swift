//
//  Comment.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 25/12/2021.
//

import Foundation
import UIKit

struct Comment: Decodable{
    
    var id: String
    var message: String
    var owner: User
}
