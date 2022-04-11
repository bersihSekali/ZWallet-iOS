//
//  HomeView.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation

protocol HomeView {
    func showUserProfileData(userProfile: UserProfileEntity)
    func showTransactionData(transactions: [TransactionEntity])
}
