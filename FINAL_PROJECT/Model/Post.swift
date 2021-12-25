//
//  Post.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 21/12/2021.
//

import Foundation
import SwiftUI

struct Post: Decodable {
    
    var id: String
    var image: String
    var likes: Int
    var text: String
    var owner: User
}
