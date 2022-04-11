//
//  TransferApi.swift
//  zwallet
//
//  Created by user217931 on 4/7/22.
//

import Foundation
import Moya

public enum TransferApi {
    case transfer(receiver: String, amount: Int, notes:String)
}

extension TransferApi : TargetType {
    public var baseURL: URL {
        URL(string: String(describing: "http://3.89.145.177:8000"))!
    }
    
    public var path: String {
        switch self {
        case .transfer:
            return "tranfer/newTranfer"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var method: Moya.Method {
        .post
    }
    
    public var task: Task {
        switch self {
        case .transfer(let receiver, let amount, let notes):
            return .requestParameters(parameters: ["receiver": receiver, "amount": amount, "notes": notes], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return ["Content-Type": "application/json",
                "x-access-PIN": "999998",
                "Authorization": "Bearer \(token)"]
    }
    
    
}
