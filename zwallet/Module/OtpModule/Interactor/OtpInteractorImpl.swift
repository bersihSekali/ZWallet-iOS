//
//  OtpInteractorImpl.swift
//  zwallet
//
//  Created by user215490 on 4/11/22.
//

import Foundation

class OtpInteractorImpl: OtpInteractorProtocol {
    var interactorOutput: OtpInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func confirmOtp(email: String, otp: String) {
        self.authNetworkManager.confirmOtp(email: email, otp: otp) { data, error in
            guard let otpData = data else {
                self.interactorOutput?.otpResult(isSuccess: false)
                return
            }
            
            if otpData.status == 200 {
                self.interactorOutput?.otpResult(isSuccess: true)
            } else {
                self.interactorOutput?.otpResult(isSuccess: false)
            }
        }

    }
}
