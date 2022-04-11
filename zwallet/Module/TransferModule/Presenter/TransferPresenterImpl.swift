//
//  TransferPresenterImpl.swift
//  zwallet
//
//  Created by user217931 on 4/8/22.
//

import Foundation
import UIKit

class TransferPresenterImpl : TransferPresenterProtocol {
    
    let view: TransferView
    let interactor: TransferInteractorProtocol
    let router: TransferRouterProtocol

    init(view: TransferView, interactor: TransferInteractorProtocol, router: TransferRouterProtocol ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func transfer(receiver: String, amount: Int, notes: String) {
        self.interactor.postTransferData(receiver: receiver, amount: amount, notes: notes)
    }
    
    func dissmisPage(vc: UIViewController) {
        self.router.navigateToHome(viewController: vc)
    }
    
}

extension TransferPresenterImpl: TransferInteractorOutput {
    func transferResult(isSuccess: Bool, message: String) {
        if isSuccess {
            self.view.showAlertSuccess()
        } else {
            self.view.showError()
        }
    }
}
