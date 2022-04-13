//
//  OtpViewController.swift
//  zwallet
//
//  Created by user217075 on 4/7/22.
//

import UIKit

class OtpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pin1: UITextField!
    @IBOutlet weak var pin2: UITextField!
    @IBOutlet weak var pin3: UITextField!
    @IBOutlet weak var pin4: UITextField!
    @IBOutlet weak var pin5: UITextField!
    @IBOutlet weak var pin6: UITextField!
    @IBOutlet weak var formWrapper: UIView!
    @IBOutlet weak var submitButton: UIButton!
    var presenter: OtpPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formWrapper.layer.cornerRadius = 50
        formWrapper.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        pin1.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        pin2.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        pin3.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        pin4.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        pin5.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        pin6.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)


        submitButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pin1.becomeFirstResponder()
    }
    
    @objc func textDidChange(textField: UITextField){
        let text = textField.text
        
        if text?.utf16.count == 1 {
            switch textField {
            case pin1:
                pin2.becomeFirstResponder()
                break
            case pin2:
                pin3.becomeFirstResponder()
                break
            case pin3:
                pin4.becomeFirstResponder()
                break
            case pin4:
                pin5.becomeFirstResponder()
                break
            case pin5:
                pin6.becomeFirstResponder()
                break
            default:
                pin6.resignFirstResponder()
                break
            }
            
            if (pin1.hasText && pin2.hasText && pin3.hasText && pin4.hasText && pin5.hasText && pin6.hasText) {
                submitButton.backgroundColor = UIColor(named: "Primary")
                submitButton.layer.cornerRadius = 10
                submitButton.titleLabel?.textColor = UIColor(ciColor: .white)
                submitButton.isEnabled = true
            }
        }
    }
    
    @IBAction func confirmButtonAction(_ sender: Any) {
        let email: String = UserDefaultHelper.shared.get(key: .userEmail) ?? ""
        let pin1 = pin1.text ?? ""
        let pin2 = pin2.text ?? ""
        let pin3 = pin3.text ?? ""
        let pin4 = pin4.text ?? ""
        let pin5 = pin5.text ?? ""
        let pin6 = pin6.text ?? ""
        
        let otp: String = "\(pin1)\(pin2)\(pin3)\(pin4)\(pin5)\(pin6)"
        if otp.count == 6 {
            self.presenter?.confirmOtp(email: email, otp: otp)
        }
    }
}

extension OtpViewController: OtpViewProtocol {
    func showSuccess() {
        let successAlert = UIAlertController(title: "Registration Success", message: "Login tou your new account to access all features of ZWallet", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK ;)", style: .default, handler: { _ in
            self.presenter?.dismissPage(vc: self)
        }))
        present(successAlert, animated: true, completion: nil)
    }
    
    func showError() {
        let successAlert = UIAlertController(title: "Registration Failed", message: "Please input again your otp code", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK ;)", style: .default, handler: { _ in
            
        }))
        present(successAlert, animated: true, completion: nil)
    }
    
    
}
