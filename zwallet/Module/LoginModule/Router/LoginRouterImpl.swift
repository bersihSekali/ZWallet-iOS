//
//  LoginRouterImpl.swift
//  zwallet
//
//  Created by user217931 on 4/3/22.
//

import Foundation
import UIKit

public class LoginRouterImpl {

    public static func navigateToModule() {
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)

        let networkManager = AuthNetworkManagerImpl()

        let router = LoginRouterImpl()
        let interactor = LoginInteractorImpl(networkManager: networkManager)
        let presenter = LoginPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter

        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension LoginRouterImpl: LoginRouterProtocol {
    func navigateToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }

    func navigateToRegister(viewController: UIViewController) {
        RegisterRouterImpl.navigateToModule(viewController: viewController)
    }
}
