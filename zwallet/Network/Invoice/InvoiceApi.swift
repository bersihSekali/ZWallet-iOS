//
//  InvoiceApi.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation
import Moya

public enum InvoiceApi {
    case getThisWeekInvoice
    case getAllInvoice
}

extension InvoiceApi: TargetType {
    public var path: String {
        switch self {
        case .getThisWeekInvoice, .getAllInvoice:
            return "/home/getAllInvoice"
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .getThisWeekInvoice:
            return .requestParameters(parameters: ["thisweek": true], encoding: URLEncoding.queryString)
        case .getAllInvoice:
            return .requestPlain
        }
    }

    public var baseURL: URL {
        return URL(string: String(describing: "http://3.89.145.177:8000"))!
    }

    public var method: Moya.Method {
        return .get
    }

    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
}
