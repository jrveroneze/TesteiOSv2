//
//  UserResponse.swift
//  Bank
//
//  Created by Oscar Veroneze Junior on 12/04/19.
//  Copyright © 2019 Junior Veroneze. All rights reserved.
//

import UIKit

class UserResponse: Codable {
    var userId : Int = 0
    var name : String?
    var bankAccount : String?
    var agency : String?
    var balance : Double?
    
    private enum CodingKeys: String, CodingKey {
        case userId
        case name
        case agency
        case bankAccount
        case balance
    }
}
