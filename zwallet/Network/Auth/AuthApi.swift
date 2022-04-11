//
//  AuthApi.swift
//  zwallet
//
//  Created by user217931 on 4/1/22.
//

import Foundation
import Moya

public enum AuthApi {
    case login(email: String, password:String)
    case register(username: String, email: String, password: String)
    case transfer(receiver: String, amount: Int, notes: String)
}

extension AuthApi : TargetType {
    public var baseURL: URL {
        URL(string: String(describing: "http://3.89.145.177:8000/"))!
    }
    
    public var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .register:
            return "auth/signup"
        case .transfer:
            return "transfer/newTransfer"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .transfer:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .register(let username, let email, let password):
            return .requestParameters(parameters: ["username": username, "email": email, "password": password], encoding: JSONEncoding.default)
        case .transfer(let receiver, let amount, let notes):
            return .requestParameters(parameters: ["receiver": receiver, "amount": amount, "notes": notes], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .login:
            return ["Content-Type": "application/json"]
        case .register:
            return ["Content-Type": "application/json"]
        case .transfer:
            return ["Content-Type": "application/json", "x-access-PIN": "123456"]
        }
    }
}
