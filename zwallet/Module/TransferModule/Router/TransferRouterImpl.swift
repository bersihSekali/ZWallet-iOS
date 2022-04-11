//
//  TransferRouterImpl.swift
//  zwallet
//
//  Created by user217931 on 4/8/22.
//

import Foundation
import UIKit

class TransferRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let vc = TransferViewController(nibName: "TransferViewController", bundle: nil)
        vc.modalPresentationStyle = .automatic

        let transferNetworkManager = TransferNetworkManagerImpl()
        let router = TransferRouterImpl()
        let interactor = TransferInteractorImpl(networkManager: transferNetworkManager)
        let presenter = TransferPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter
        vc.presenter = presenter

        viewController.present(vc, animated: true, completion: nil)
    }
}

extension TransferRouterImpl: TransferRouterProtocol {
    func navigateToHome(viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
