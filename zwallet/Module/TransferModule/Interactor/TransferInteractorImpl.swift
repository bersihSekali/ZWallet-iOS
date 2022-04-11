//
//  TransferInteractorImpl.swift
//  zwallet
//
//  Created by user217931 on 4/7/22.
//

import Foundation

class TransferInteractorImpl: TransferInteractorProtocol{
    var interactorOutput: TransferInteractorOutput?
    let transferNetworkManager: TransferNetworkManager
    
    init(networkManager: TransferNetworkManager) {
        self.transferNetworkManager = networkManager
    }
    
    func postTransferData(receiver: String, amount: Int, notes: String) {
        self.transferNetworkManager.transfer(receiver: receiver, amount: amount, notes: notes, completion: { data, error in
            if let transferData = data {
                self.interactorOutput?.transferResult(isSuccess: true, message: transferData.message)
            } else {
                self.interactorOutput?.transferResult(isSuccess: false, message: error?.localizedDescription ?? "")
            }
        })
    }
    
    
}
