//
//  LoginDataResponse.swift
//  zwallet
//
//  Created by user217931 on 4/1/22.
//

import Foundation

public struct LoginResponse: Codable {
    public var status: Int
    public var message: String
    public var data: LoginDataResponse
}

public struct LoginDataResponse: Codable {
    public var id: Int
    public var email: String
    public var token: String
}
