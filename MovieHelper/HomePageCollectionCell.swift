//
//  HomePageCollectionCell.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HomePageCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var firstImageView: UIImageView!
 
    
    var result:Results!{
        didSet{
            if result != nil{
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(result.poster_path!)")
                firstImageView.kf.setImage(with: url)
                contentView.layer.borderWidth = 1
                contentView.layer.borderColor = UIColor.lightGray.cgColor
                contentView.layer.cornerRadius = 10
                contentView.layer.masksToBounds = true
          
            } else {
                
            }
        }
    }
}
