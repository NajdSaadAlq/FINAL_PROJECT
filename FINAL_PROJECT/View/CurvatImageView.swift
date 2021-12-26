//
//  CurvatImageView.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 26/12/2021.
//

import UIKit

class CurvatImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setCurvatToImage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCurvatToImage()
    }
    func setCurvatToImage(){
        self.layer.cornerRadius = 15
    }
}
