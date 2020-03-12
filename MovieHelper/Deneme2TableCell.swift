//
//  Deneme2TableCell.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 18.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class Deneme2TableCell : UITableViewCell {
    
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var seriesImg: UIImageView!
    
    
    var series : TvResult! {
        didSet{
            if series != nil {
                
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(series.poster_path!)")
                seriesImg.kf.setImage(with: url)
                seriesLabel.text = series.original_name
                
            }
        }
    }
}
