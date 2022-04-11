//
//  RegisterEntity.swift
//  zwallet
//
//  Created by user215490 on 4/6/22.
//

import Foundation

struct RegisterEntity {
    var username: String
    var email: String
    var password: String
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
}

public struct RegisterResponse: Codable {
    public var status: Int
    public var message: String
}
