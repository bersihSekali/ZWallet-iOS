//
//  OtpInteractorProtocol.swift
//  zwallet
//
//  Created by user215490 on 4/11/22.
//

import Foundation

protocol OtpInteractorProtocol {
    func confirmOtp(email: String, otp: String)
}
