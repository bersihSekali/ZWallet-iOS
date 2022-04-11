//
//  GetInvoiceDataResponse.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation

public struct GetInvoiceDataResponse: Codable {
    public var id: Int
    public var sender: Int
    public var receiver: Int
    public var name: String
    public var phone: String
    public var image: String
    public var type: String
    public var amount: Int
    public var notes: String
}
