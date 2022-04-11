//
//  AppRouter.swift
//  zwallet
//
//  Created by user217931 on 4/4/22.
//

import Foundation

import UIKit

public class AppRouter {

    public static let shared: AppRouter = AppRouter()
    
    //Login Scene
    public var loginScene: (() -> ())? = nil

    public func navigateToLogin() {
        self.loginScene?()
    }
    
    //Register Scene
    public var registerScene: (() -> ())? = nil
    public func navigateToRegister() {
        self.registerScene?()
    }

    //Home Scene
    public var homeScene: (() -> ())? = nil

    public func navigateToHome() {
        self.homeScene?()
    }
    
    //Transfer Scene
    public var transferScene: (() -> ())? = nil

    public func navigateToTransfer() {
        self.transferScene?()
    }

    //History Scene
    public var historyScene: ((_ viewController: UIViewController) -> ())? = nil

    public func navigateToHistory(_ viewController: UIViewController) {
        self.historyScene?(viewController)
    }
}
