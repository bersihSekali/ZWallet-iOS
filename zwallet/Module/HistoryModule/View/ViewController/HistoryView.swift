//
//  HistoryView.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation

protocol HistoryView {
    func showTransaction(transaction: [TransactionEntity])
}
