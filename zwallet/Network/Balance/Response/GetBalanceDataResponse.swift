//
//  GetBalanceDataResponse.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation

public struct GetBalanceDataResponse: Codable {
    public var id: Int
    public var name: String
    public var phone: String
    public var balance: Int
    public var image: String
}
