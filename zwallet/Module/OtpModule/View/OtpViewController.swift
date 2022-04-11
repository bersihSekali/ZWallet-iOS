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


        // Do any additional setup after loading the view.
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
                submitButton.backgroundColor = UIColor(named: "primaryColor")
                submitButton.layer.cornerRadius = 10
                submitButton.titleLabel?.textColor = UIColor(ciColor: .white)
                break
            }
        }
    
        else {
            
        }
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
