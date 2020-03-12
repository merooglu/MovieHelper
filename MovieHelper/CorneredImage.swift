//
//  CorneredImage.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 5.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

var ImageBorderWith : CGFloat = 1
var ImageBorderColor = UIColor.red.cgColor
var ImageBorderAlpha : CGFloat = 1

class CorneredImage: UIImageView {
    override func awakeFromNib() {
        self.layer.borderWidth = ImageBorderWith
        self.layer.opacity = Float(ImageBorderAlpha)
        self.layer.borderColor = ImageBorderColor
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}
