//
//  DenemeCell.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 14.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class DenemeCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    

    var result: Results! {
        didSet {
            if result != nil {
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(result.poster_path!)")
                mainImage.kf.setImage(with: url)
            }
        }
    }
}
