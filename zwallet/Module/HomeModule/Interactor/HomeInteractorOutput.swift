//
//  HomeInteractorOutput.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation

protocol HomeInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity)
    func loadedTransaction(transactions: [TransactionEntity])
}
