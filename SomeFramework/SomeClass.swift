//
//  SomeClass.swift
//  SomeFramework
//
//  Created by Erik Villegas on 9/23/17.
//  Copyright © 2017 Carvana. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

public class SomeClass {
    public func someFunction() -> Promise<Any> {
        return Promise { fullfill, reject in
            Alamofire.request("https://httpbin.org/get").responseJSON { response in
                switch response.result {
                case .success(let json):
                    fullfill(json)
                case .failure(let error):
                    reject(error)
                }
            }
        }
    }
    
    public init() {}
}
