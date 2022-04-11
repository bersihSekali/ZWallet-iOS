//
//  RegisterInteractorImpl.swift
//  zwallet
//
//  Created by user215490 on 4/6/22.
//

import Foundation

class RegisterInteractorImpl: RegisterInteractorProtocol {
    var interactorOutput: RegisterInteractorOutput?
    var authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postRegisterData(username: String, email: String, password: String) {
        self.authNetworkManager.register(username: username, email: email, password: password) { (data, error) in
            guard let registerData = data else {
                self.interactorOutput?.authRegisterResult(isSuccess: false, message: error.debugDescription)
                return
            }
            
            if registerData.status == 200 {
                self.interactorOutput?.authRegisterResult(isSuccess: true, message: "Sukses")
                UserDefaultHelper.shared.set(key: .userEmail, value: email)
            } else {
                self.interactorOutput?.authRegisterResult(isSuccess: false, message: registerData.message)
            }
        }
    }
}
