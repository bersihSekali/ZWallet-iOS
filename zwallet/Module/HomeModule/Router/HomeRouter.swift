//
//  HomeRouter.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation
import UIKit

protocol HomeRouter {
    func navigateToHistory(viewController: UIViewController)
    func navigateToTransfer(viewController: UIViewController)
    func navigateToLogin()
}
