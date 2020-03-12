//
//  TvResult.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 18.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class TvResult : NSObject, Mappable {
    
    var poster_path : String?
    var popularity : Int?
    var id : Int?
    var backdrop_path : String?
    var vote_average : String?
    var overview : String?
    var first_air_date : String?
    var original_language  :String?
    var vote_count : String?
    var name : String?
    var original_name : String?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        poster_path                 <- map["poster_path"]
        popularity                  <- map["popularity"]
        id                          <- map["id"]
        backdrop_path               <- map["backdrop_path"]
        vote_average                <- map["vote_average"]
        overview                    <- map["overview"]
        first_air_date              <- map["first_air_date"]
        original_language           <- map["original_language"]
        vote_count                  <- map["vote_count"]
        name                        <- map["name"]
        original_name               <- map["original_name"]
        
    }
}
