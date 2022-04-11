//
//  HomePresenterImpl.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation
import UIKit

class HomePresenterImpl: HomePresenter {
    
    let view: HomeView
    let interactor: HomeInteractor
    let router: HomeRouter

    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func showHistory(viewController: UIViewController) {
        self.router.navigateToHistory(viewController: viewController)
    }

    func loadProfile() {
        self.interactor.getUserProfile()
    }

    func loadTransaction() {
        self.interactor.getTransaction()
    }
    
    func showTransfer(viewController: UIViewController) {
        self.router.navigateToTransfer(viewController: viewController)
    }

    func logout() {
        UserDefaultHelper.shared.remove(key: .userToken)
        self.router.navigateToLogin()
    }

}

extension HomePresenterImpl: HomeInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showUserProfileData(userProfile: userProfile)
    }

    func loadedTransaction(transactions: [TransactionEntity]) {
        self.view.showTransactionData(transactions: transactions)
    }

}
