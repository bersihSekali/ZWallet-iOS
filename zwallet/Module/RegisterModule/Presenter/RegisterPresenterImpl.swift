//
//  RegisterPresenterImpl.swift
//  zwallet
//
//  Created by user215490 on 4/6/22.
//

import Foundation
import UIKit


class RegisterPresenterImpl: RegisterPresenterProtocol {
    let view: RegisterViewProtocol
    let interactor: RegisterInteractorProtocol
    let router: RegisterRouterProtocol
    
    init(view: RegisterViewProtocol, interactor: RegisterInteractorProtocol, router: RegisterRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func register(username: String, email: String, password: String) {
        self.interactor.postRegisterData(username: username, email: email, password: password)
    }
    
    func loginPage(viewController: UIViewController) {
        self.router.navigateToLogin(viewController: viewController)
    }
    
    func dismissPage(vc: UIViewController) {
        self.router.navigateToLogin(viewController: vc)
    }
}

extension RegisterPresenterImpl: RegisterInteractorOutput {
    func authRegisterResult(isSuccess: Bool, message: String) {
        if isSuccess {
            self.view.showSuccess()
        } else {
            self.view.showError()
        }
    }
}
