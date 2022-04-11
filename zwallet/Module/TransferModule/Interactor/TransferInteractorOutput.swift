//
//  TransferInteractorOutput.swift
//  zwallet
//
//  Created by user217931 on 4/7/22.
//

import Foundation

protocol TransferInteractorOutput {
    func transferResult(isSuccess: Bool, message: String)
}
