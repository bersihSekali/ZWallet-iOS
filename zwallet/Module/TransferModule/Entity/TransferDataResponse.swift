//
//  TransferDataResponse.swift
//  zwallet
//
//  Created by user217931 on 4/7/22.
//

import Foundation

public struct TransferResponse: Codable {
    let status: Int
    let message: String
    let details: TransferDataResponse
}

public struct TransferDataResponse: Codable {
    let sender, receiver, amount: Int
    let notes: String
    let type: Int
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case sender, receiver, amount, notes, type
        case createdAt = "created_at"
    }
}
