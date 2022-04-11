//
//  HomePresenter.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation
import UIKit

protocol HomePresenter {
    func loadProfile()
    func loadTransaction()
    func showHistory(viewController: UIViewController)
    func showTransfer(viewController: UIViewController)
    func logout()
}
