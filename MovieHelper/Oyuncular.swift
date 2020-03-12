//
//  Oyuncular.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 4.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Oyuncular : NSObject, Mappable {
    var id :String?
    var cast = [Cast]()
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id              <- map["id"]
        cast            <- map["cast"]
    }
}
