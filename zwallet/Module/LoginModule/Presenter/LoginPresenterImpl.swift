//
//  LoginPresenterImpl.swift
//  zwallet
//
//  Created by user217931 on 4/3/22.
//

import Foundation
import UIKit

class LoginPresenterImpl: LoginPresenterProtocol{
    let view: LoginViewProtocol
    let interactor: LoginInteractorProtocol
    let router: LoginRouterProtocol
    
    init (view: LoginViewProtocol, interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func login(email: String, password: String) {
        self.interactor.postLoginData(email: email, password: password)
    }
    
    
    func registerPage(viewController: UIViewController) {
        self.router.navigateToRegister(viewController: viewController)
    }
}

extension LoginPresenterImpl: LoginInteractorOutputProtocol{
    func authenticationResult(isSuccess: Bool) {
        if isSuccess {
            self.router.navigateToHome()
        } else {
            self.view.showError()
        }
    }
}
