//
//  TransferPresenterProtocol.swift
//  zwallet
//
//  Created by user217931 on 4/7/22.
//

import Foundation
import UIKit

protocol TransferPresenterProtocol{
    func transfer(receiver: String, amount: Int, notes: String)
    func dissmisPage(vc: UIViewController)
}
