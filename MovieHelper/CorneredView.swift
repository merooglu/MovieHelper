//
//  CorneredView.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 4.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

class CorneredView: UIView{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
      self.layer.cornerRadius = 10
        
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
    }
}
