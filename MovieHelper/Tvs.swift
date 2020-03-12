//
//  Tvs.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 18.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Tvs : NSObject, Mappable {
    
    var page : Int?
    var results = [TvResult]()
    var total_results : Int?
    var total_pages : Int?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        page            <- map["page"]
        results         <- map["results"]
        total_results     <- map["total_results"]
        total_pages       <- map["total_pages"]
    }
}
