//
//  LoginViewController.swift
//  zwallet
//
//  Created by user217931 on 3/29/22.
//

import UIKit

class LoginViewController2: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var inputPasswordField: UITextField!
    @IBOutlet weak var inputEmailField: UITextField!
    @IBOutlet weak var loginDescLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var zwalletLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.zwalletLabel.font = NunitoFonts.nunitoBold(sizeOf: 26)
        self.zwalletLabel.textColor = UIColor(red: 0.387, green: 0.474, blue: 0.958, alpha: 1)
        
        self.loginLabel.font = NunitoFonts.nunitoBold(sizeOf: 24)
        self.loginLabel.textColor = UIColor(red: 0.228, green: 0.238, blue: 0.258, alpha: 1)
        
        self.loginDescLabel.font = NunitoFonts.nunitoRegular(sizeOf: 16)
        self.loginDescLabel.textColor = UIColor(red: 0.227, green: 0.239, blue: 0.259, alpha: 0.6)
        
        self.inputEmailField.font = NunitoFonts.nunitoRegular(sizeOf: 16)
        self.inputEmailField.textColor = UIColor(red: 0.228, green: 0.238, blue: 0.258, alpha: 1)
        
        self.inputPasswordField.font = NunitoFonts.nunitoRegular(sizeOf: 16)
        self.inputPasswordField.textColor = UIColor(red: 0.228, green: 0.238, blue: 0.258, alpha: 1)
        
        self.forgotPasswordButton.titleLabel?.font = NunitoFonts.nunitoRegular(sizeOf: 14)
        self.forgotPasswordButton.titleLabel?.textColor = UIColor(red: 0.228, green: 0.238, blue: 0.258, alpha: 1)
        
        self.loginButton.titleLabel?.font = NunitoFonts.nunitoBold(sizeOf: 18)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
