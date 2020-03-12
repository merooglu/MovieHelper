//
//  SlideMenuCell.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

class SlideMenuCell: UITableViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var slideMenuItem: SlideMenuItem! {
        didSet {
            mainImage.image = slideMenuItem.icon
            titleLabel.text = slideMenuItem.title
            titleLabel.textColor = UIColor.black
            
        }
    }
}
