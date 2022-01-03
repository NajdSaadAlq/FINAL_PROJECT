//
//  CircularView.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 26/12/2021.
//

import Foundation
import UIKit

class CircularView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupShadow()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupShadow()
    }
    func setupShadow(){
        
        self.layer.cornerRadius = self.frame.width/2
    }
}
