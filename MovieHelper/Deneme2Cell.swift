//
//  Deneme2Cell.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 18.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class Deneme2Cell: UICollectionViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    
    var deneme : Results! {
        didSet{
            if deneme != nil {
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(deneme.poster_path!)")
                mainImage.kf.setImage(with: url)
                mainImage.layer.borderColor = UIColor.lightGray.cgColor
                mainImage.layer.borderWidth = 1
                mainImage.layer.cornerRadius = 10
                mainImage.layer.masksToBounds = true
            }
        }
    }
}
