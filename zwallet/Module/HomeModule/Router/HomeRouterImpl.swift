//
//  HomeRouterImpl.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation
import UIKit

public class HomeRouterImpl {

    public static func navigateToModule() {
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)

        let balanceNetworkManager = BalanceNetworkManagerImpl()
        let invoiceNetworkManager = InvoiceNetworkManagerImpl()

        let router = HomeRouterImpl()
        let interactor = HomeInteractorImpl(balanceNetworkManager: balanceNetworkManager, invoiceNetworkManager: invoiceNetworkManager)
        let presenter = HomePresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter

        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }

}

extension HomeRouterImpl: HomeRouter {
    func navigateToTransfer(viewController: UIViewController) {
        TransferRouterImpl.navigateToModule(viewController: viewController)
    }
    

    func navigateToHistory(viewController: UIViewController) {
        HistoryRouterImpl.navigateToModule(viewController: viewController)
    }

    func navigateToLogin() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
}
