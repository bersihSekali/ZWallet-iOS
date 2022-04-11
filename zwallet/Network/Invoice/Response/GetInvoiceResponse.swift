//
//  GetInvoiceResponse.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation

public struct GetInvoiceResponse: Codable {
    var status: Int
    var message: String
    var data: [GetInvoiceDataResponse]
}
