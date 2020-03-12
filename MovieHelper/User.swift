//
//  User.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 24.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class User : NSObject, Mappable {
    
    var id : Int?
    var name : String?
    var email : String?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id              <- map["id"]
        name            <- map["name"]
        email           <- map["email"]
    }
}
