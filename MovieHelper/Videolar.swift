//
//  Videolar.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 3.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Videolar : NSObject, Mappable {
    var id : String?
    var videoResult = [Videos]()
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id              <- map["id"]
        videoResult     <- map["results"]
    }
}
