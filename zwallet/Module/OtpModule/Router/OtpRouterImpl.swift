//
//  OtpRouterImpl.swift
//  zwallet
//
//  Created by user215490 on 4/11/22.
//

import Foundation
import UIKit

class OtpRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let vc = OtpViewController(nibName: "OtpViewController", bundle: nil)
        vc.modalPresentationStyle = .automatic
        
        let authNetworkManager = AuthNetworkManagerImpl()
        let router = OtpRouterImpl()
        let interactor = OtpInteractorImpl(networkManager: authNetworkManager)
        let presenter = OtpPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter

        viewController.present(vc, animated: true, completion: nil)
    }
}

extension OtpRouterImpl: OtpRouterProtocol {
    func navigateToLogin(viewController: UIViewController) {
        LoginRouterImpl.navigateToModule()
    }
}
