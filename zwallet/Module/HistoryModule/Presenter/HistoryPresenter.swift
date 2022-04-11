//
//  HistoryPresenter.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import Foundation
import UIKit

protocol HistoryPresenter {
    func loadHistory()
    func dismiss(viewController: UIViewController)
}
