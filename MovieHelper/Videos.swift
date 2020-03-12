//
//  Videos.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 31.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Videos : NSObject, Mappable {
    
    var id : String?
    var key : String?
    var name : String?
    var site : String?
    var size :String?
    
    required init(map : Map) {
        
    }
    
    public func mapping(map: Map) {
        id              <- map["id"]
        key             <- map["key"]
        name            <- map["name"]
        site            <- map["site"]
        size            <- map["size"]
    }
}

