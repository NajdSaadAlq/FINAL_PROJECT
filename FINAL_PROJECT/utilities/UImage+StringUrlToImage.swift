//
//  UImage+StringUrlToImage.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 26/12/2021.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromStringUrl(stringUrl: String){
        if let url = URL(string: stringUrl){
            if let imageDate = try? Data(contentsOf: url){
                self.image = UIImage(data: imageDate)
            }}
    }
}
