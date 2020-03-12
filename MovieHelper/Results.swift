//
//  Results.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Results : NSObject, Mappable {
    
    var poster_path : String?
    var adult : String?
    var overview : String?
    var release_date : String?
    var id : Int?
    var original_title : String?
    var original_language : String?
    var title : String?
    var backdrop_path : String?
    var popularity : Int?
    var vote_count :Int?
    var video : String?
    var vote_average :String?
    
    required init(map : Map) {
        
    }
    
    public func mapping(map: Map) {
        poster_path                 <- map["poster_path"]
        adult                       <- map["adult"]
        overview                    <- map["overview"]
        release_date                <- map["release_date"]
        id                          <- map["id"]
        original_title              <- map["original_title"]
        original_language           <- map["original_language"]
        backdrop_path               <- map["backdrop_path"]
        popularity                  <- map["popularity"]
        vote_count                  <- map["vote_count"]
        video                       <- map["video"]
        vote_average                <- map["vote_average"]
    }
}
