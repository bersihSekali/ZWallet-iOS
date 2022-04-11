//
//  RegisterRouterImpl.swift
//  zwallet
//
//  Created by user215490 on 4/6/22.
//

import Foundation
import UIKit

class RegisterRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        vc.modalPresentationStyle = .automatic
        
        let authNetworkManager = AuthNetworkManagerImpl()
        let router = RegisterRouterImpl()
        let interactor = RegisterInteractorImpl(networkManager: authNetworkManager)
        let presenter = RegisterPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter

        viewController.present(vc, animated: true, completion: nil)
    }
}

extension RegisterRouterImpl: RegisterRouterProtocol {
    func navigateToLogin(viewController: UIViewController) {
        LoginRouterImpl.navigateToModule()
    }
}
