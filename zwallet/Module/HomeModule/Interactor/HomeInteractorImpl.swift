//
//  HomeInteractorImpl.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation

class HomeInteractorImpl: HomeInteractor {

    var interactorOutput: HomeInteractorOutput?

    let balanceNetworkManager: BalanceNetworkManager
    let invoiceNetworkManager: InvoiceNetworkManager

    init(balanceNetworkManager: BalanceNetworkManager, invoiceNetworkManager: InvoiceNetworkManager) {
        self.balanceNetworkManager = balanceNetworkManager
        self.invoiceNetworkManager = invoiceNetworkManager
    }

    func getUserProfile() {
        self.balanceNetworkManager.getBalance { (data, error) in
            if let balance = data {
                let userProfile = UserProfileEntity(name: balance.name, balance: balance.balance, phoneNumber: balance.phone, imageUrl: "\(AppConstant.baseUrl)\(balance.image)")
                self.interactorOutput?.loadedUserProfileData(userProfile: userProfile)
            }
        }
    }

    func getTransaction() {
        self.invoiceNetworkManager.getThisWeekInvoice { (data, error) in
            var transactions: [TransactionEntity] = []

            data?.forEach({ (invoiceData) in
                transactions.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)", amount: invoiceData.amount, notes: invoiceData.notes))

                self.interactorOutput?.loadedTransaction(transactions: transactions)
            })
        }
    }

}
