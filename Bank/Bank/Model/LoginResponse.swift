//
//  LoginResponse.swift
//  Bank
//
//  Created by Oscar Veroneze Junior on 12/04/19.
//  Copyright © 2019 Junior Veroneze. All rights reserved.
//

import UIKit

class LoginResponse: Codable {
    var userAccount : UserResponse?
    var error : Error?
    
}
