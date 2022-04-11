//
//  InvoiceNetworkManager.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation

public protocol InvoiceNetworkManager {
    func getThisWeekInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
    func getAllInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
}
