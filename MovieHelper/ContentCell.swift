//
//  ContentCell.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 4.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ContentCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var originalNameLabel: UILabel!
    
    
    
    var cast : Cast! {
        didSet{
            if cast != nil {
                guard let photo = cast.profile_path else {
                    return
                }
                
                

                let url = URL(string: "https://image.tmdb.org/t/p/w500\(photo)")
                characterImage.kf.setImage(with: url)
            
                characterImage.layer.borderWidth = 1
                characterImage.layer.borderColor = UIColor.red.cgColor
                characterImage.layer.cornerRadius = 40 //characterImage.frame.height/2
                characterImage.layer.masksToBounds = false
                characterImage.clipsToBounds = true

            

                characterNameLabel.text = cast.character
                originalNameLabel.text = cast.name
            }else {
                
            }
        }
    }
}
