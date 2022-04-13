//
//  RegisterViewController.swift
//  zwallet
//
//  Created by user215490 on 4/6/22.
//

import UIKit

class RegisterViewController: UIViewController  {
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var inputUsername: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    
    @IBOutlet weak var usernameImage: UIImageView!
    @IBOutlet weak var usernameUnderline: UIView!
    @IBOutlet weak var emailImage: UIImageView!
    @IBOutlet weak var emailUnderline: UIView!
    @IBOutlet weak var passwordImage: UIImageView!
    @IBOutlet weak var eyeSlashButton: UIButton!
    @IBOutlet weak var passwordUnderline: UIView!
    
    @IBOutlet weak var zwalletLabel: UILabel!
    @IBOutlet weak var signUpDescLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    
    var presenter: RegisterPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputUsername.delegate = self
        inputEmail.delegate = self
        inputPassword.delegate = self
        
        self.zwalletLabel.textColor = UIColor(named: "Primary")
        self.signUpDescLabel.textColor = UIColor(named: "Gray")
        self.inputUsername.textColor = UIColor(named: "Black")
        self.inputEmail.textColor = UIColor(named: "Black")
        self.inputPassword.textColor = UIColor(named: "Black")
        
        contentView.layer.cornerRadius = 50
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        signUpButton.layer.cornerRadius = 20
        signUpButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    @IBAction func eyeSlashButtonAction(_ sender: Any) {
        if inputPassword.isSecureTextEntry {
            inputPassword.isSecureTextEntry = false
            eyeSlashButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            inputPassword.isSecureTextEntry = true
            eyeSlashButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        let username: String = inputUsername.text ?? ""
        let email: String = inputEmail.text ?? ""
        let password: String = inputPassword.text ?? ""

        self.presenter?.register(username: username, email: email, password: password)
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        self.presenter?.dismissPage(vc: self)
    }
}

extension RegisterViewController: RegisterViewProtocol {
    func showSuccess() {
        let successAlert = UIAlertController(title: "Registration Success", message: "Registration success, check your email to activating your account", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK ;)", style: .default, handler: { _ in
            self.presenter?.otpPage(viewController: self)
        }))
        present(successAlert, animated: true, completion: nil)
    }
    
    func showError() {
        let successAlert = UIAlertController(title: "Registration Failed", message: "Email already exist, please choose another email!", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK ;)", style: .default, handler: { _ in
            
        }))
        present(successAlert, animated: true, completion: nil)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == inputUsername {
            usernameImage.tintColor = UIColor(named: "Primary")
            usernameUnderline.backgroundColor = UIColor(named: "Primary")
        } else if textField == inputEmail {
            emailImage.tintColor = UIColor(named: "Primary")
            emailUnderline.backgroundColor = UIColor(named: "Primary")
        } else if textField == inputPassword {
            passwordImage.tintColor = UIColor(named: "Primary")
            passwordUnderline.backgroundColor = UIColor(named: "Primary")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == inputUsername {
            if inputUsername.text == "" {
                usernameImage.tintColor = UIColor(named: "Gray")
                usernameUnderline.backgroundColor = UIColor(named: "Gray")
            }
        } else if textField == inputEmail {
            if inputEmail.text == ""{
                emailImage.tintColor = UIColor(named: "Gray")
                emailUnderline.backgroundColor = UIColor(named: "Gray")
            }
        } else if textField == inputPassword {
            if inputPassword.text == "" {
                passwordImage.tintColor = UIColor(named: "Gray")
                passwordUnderline.backgroundColor = UIColor(named: "Gray")
            }
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == inputUsername {
            if inputUsername.text == "" {
                usernameImage.image = UIImage(systemName: "person")
            } else {
                usernameImage.image = UIImage(systemName: "person.fill")
            }
        } else if textField == inputEmail {
            if inputEmail.text == "" {
                emailImage.image = UIImage(systemName: "envelope")
            } else {
                emailImage.image = UIImage(systemName: "envelope.fill")
            }
        } else if textField == inputPassword {
            if inputPassword.text == "" {
                passwordImage.image = UIImage(systemName: "lock")
                signUpButton.backgroundColor = UIColor(named: "GrayButton")
                signUpButton.titleLabel?.textColor = UIColor(named: "DarkGrayText")
            } else {
                passwordImage.image = UIImage(systemName: "lock.fill")
                signUpButton.backgroundColor = UIColor(named: "Primary")
                signUpButton.titleLabel?.textColor = UIColor(ciColor: .white)
            }
        }
    }
}
