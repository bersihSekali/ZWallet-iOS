//
//  RegisterPresenterProtocol.swift
//  zwallet
//
//  Created by user215490 on 4/6/22.
//

import Foundation
import UIKit

protocol RegisterPresenterProtocol {
    func register(username: String, email: String, password: String)
    func otpPage(viewController: UIViewController)
    func dismissPage(vc: UIViewController)
}
