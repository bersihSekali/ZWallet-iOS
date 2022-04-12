//
//  OtpPresenterImpl.swift
//  zwallet
//
//  Created by user215490 on 4/11/22.
//

import Foundation
import UIKit

class OtpPresenterImpl: OtpPresenterProtocol {
    let view: OtpViewProtocol
    let interactor: OtpInteractorProtocol
    let router: OtpRouterProtocol
    
    init (view: OtpViewProtocol, interactor: OtpInteractorProtocol, router: OtpRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func confirmOtp(email: String, otp: String?) {
        self.interactor.confirmOtp(email: email, otp: otp ?? "")
    }
    
    func dismissPage(vc: UIViewController) {
        self.router.navigateToLogin(viewController: vc)
    }
}

extension OtpPresenterImpl: OtpInteractorOutput {
    func otpResult(isSuccess: Bool) {
        if isSuccess {
            self.view.showSuccess()
        } else {
            self.view.showError()
        }
    }
}
