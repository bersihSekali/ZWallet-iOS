//
//  LoginInteractorImpl.swift
//  zwallet
//
//  Created by user217931 on 4/3/22.
//

import Foundation

class LoginInteractorImpl: LoginInteractorProtocol{
    var interactorOutput: LoginInteractorOutputProtocol?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postLoginData(email: String, password: String) {
        self.authNetworkManager.login(email: email, password: password) { data, error in
            if let loginData = data {
                UserDefaultHelper.shared.set(key: .userToken, value: loginData.token)
                self.interactorOutput?.authenticationResult(isSuccess: true)
            } else {
                self.interactorOutput?.authenticationResult(isSuccess: false)
            }
        }
    }
}
