//
//  TransferInteractorProtocol.swift
//  zwallet
//
//  Created by user217931 on 4/7/22.
//

import Foundation

protocol TransferInteractorProtocol{
    func postTransferData(receiver: String, amount: Int, notes: String)
}
