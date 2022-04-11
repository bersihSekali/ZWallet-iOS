//
//  TransferNetworkManager.swift
//  zwallet
//
//  Created by user217931 on 4/7/22.
//

import Foundation

public protocol TransferNetworkManager {
    func transfer(receiver:String, amount: Int, notes:String, completion: @escaping(TransferResponse?, Error?) -> ())
}
