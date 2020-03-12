//
//  Films.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Films : NSObject, Mappable {
    
    var page : Int?
    var results = [Results]()
    var total_pages : Int?
    var total_results : Int?
    
    required init(map : Map) {
    
    }
    
    public func mapping(map: Map) {
        page                <- map["page"]
        results             <- map["results"]
        total_pages         <- map["total_pages"]
        total_results       <- map["total_results"]
    }
}
