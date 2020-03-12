//
//  Register.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 24.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Register: NSObject, Mappable {
    
    var token : String?
    var deleted_at : String?
    var user : User?
    
    required init(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        token           <- map["token"]
        deleted_at      <- map["deleted_at"]
        user            <- map["user"]
    }
}
