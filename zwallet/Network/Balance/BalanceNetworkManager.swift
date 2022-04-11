//
//  BalanceNetworkManager.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation

public protocol BalanceNetworkManager {
    func getBalance(completion: @escaping (GetBalanceDataResponse?, Error?) -> ())
}
