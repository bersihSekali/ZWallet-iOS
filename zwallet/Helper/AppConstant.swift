//
//  AppConstant.swift
//  zwallet
//
//  Created by user217931 on 4/4/22.
//

import Foundation

public class AppConstant {
    public static var baseUrl: String {
        return Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    }
}
