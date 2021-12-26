//
//  ShadowView.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 26/12/2021.
//

import UIKit

class ShadowView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupShadow()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupShadow()
    }
    func setupShadow(){
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 5
        self.layer.cornerRadius = 15
    }
}
