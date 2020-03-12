//
//  SimilarCell.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 7.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class SimilarCell : UICollectionViewCell {
    
    @IBOutlet weak var simMovImg: UIImageView!
    @IBOutlet weak var simMovNameLbl: UILabel!
    
    var similar : Results! {
        didSet {
            if similar != nil {
                guard let simPhoto = similar.poster_path else {
                    return
                }
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(simPhoto)")
                simMovImg.kf.setImage(with: url)
                
                simMovImg.layer.borderWidth = 1
                simMovImg.layer.borderColor = UIColor.red.cgColor
                simMovImg.layer.cornerRadius = 10 //characterImage.frame.height/2
                simMovImg.layer.masksToBounds = false
                simMovImg.clipsToBounds = true
                
                simMovNameLbl.text = similar.original_title
            }else {
                
            }
        }
    }
}
