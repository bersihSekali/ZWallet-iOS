//
//  AuthNetworkManager.swift
//  zwallet
//
//  Created by user217931 on 4/1/22.
//

import Foundation

public protocol AuthNetworkManager {
    func login(
        email:String,
        password:String,
        completion: @escaping(LoginDataResponse?, Error?) -> ()
    )
    
    func register(
        username: String,
        email: String,
        password: String,
        completion: @escaping(RegisterResponse?, Error?) -> ()
    )
    
    func confirmOtp(
        email: String,
        otp: String,
        completion: @escaping(ConfirmOtpResponse?, Error?) -> ()
    )
}
