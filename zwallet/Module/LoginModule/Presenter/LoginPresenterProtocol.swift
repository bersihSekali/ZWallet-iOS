//
//  LoginPresenterProtocol.swift
//  zwallet
//
//  Created by user217931 on 4/3/22.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol{
    func login(email: String, password: String)
    func registerPage(viewController: UIViewController)
}
