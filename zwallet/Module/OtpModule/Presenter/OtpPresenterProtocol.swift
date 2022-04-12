//
//  OtpPresenterProtocol.swift
//  zwallet
//
//  Created by user215490 on 4/11/22.
//

import Foundation
import UIKit

protocol OtpPresenterProtocol {
    func confirmOtp(email: String, otp: String?)
    func dismissPage(vc: UIViewController)
}
