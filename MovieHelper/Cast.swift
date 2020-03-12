//
//  Cast.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 4.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Cast : NSObject, Mappable {
    
    var cast_id : String?
    var character : String?
    var credit_id : String?
    var id : String?
    var name : String?
    var profile_path : String?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        cast_id             <- map["cast_id"]
        character           <- map["character"]
        credit_id           <- map["credit_id"]
        id                  <- map["id"]
        name                <- map["name"]
        profile_path        <- map["profile_path"]
        
    }
}
