//
//  Error.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import ObjectMapper

class Error: Mappable{
    
    var error : String!
    var code : String!
    
    init(_ error : NSError ){
        self.code = String(error.code)
        self.error = error.localizedDescription
    }
    
    init (code: String, error: String){
        self.code = code
        self.error = error
    }
    
    required init(map: Map) {
    }
    
    public func mapping(map: Map) {
        error               <- map["error"]
        code                <- map["code"]
    }
}
