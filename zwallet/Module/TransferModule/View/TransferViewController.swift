//
//  TransferViewController.swift
//  zwallet
//
//  Created by user217931 on 4/7/22.
//

import UIKit

class TransferViewController: UIViewController {

    @IBOutlet weak var profileWrapper: UIView!
    @IBOutlet weak var receiverWrapper: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var notesField: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var receiverPhoneNumber: UILabel!
    
    var presenter: TransferPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        amountLabel.delegate = self
        notesField.delegate = self
        
        profileWrapper.layer.cornerRadius = 50
        profileWrapper.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        receiverWrapper.layer.cornerRadius = 20
        receiverWrapper.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        transferButton.layer.cornerRadius = 20
        transferButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        if let homeVC = presentingViewController as? HomeViewController {
            DispatchQueue.main.async {
                homeVC.setupTableView()

                homeVC.presenter?.loadProfile()
                homeVC.presenter?.loadTransaction()
            }
        }
    }

    @IBAction func transferButtonActioin(_ sender: Any) {
        let receiver: String = "1047"
        let amount: Int? = Int(amountLabel.text ?? "0")
        let notes: String = notesField.text ?? ""
        
        self.presenter?.transfer(receiver: receiver, amount: amount ?? 0, notes: notes)
    }

}

extension TransferViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (textField == amountLabel) || (textField == notesField) {
            if (amountLabel.text == "") || (notesField.text?.count ?? 0 < 10) {
                transferButton.backgroundColor = UIColor(named: "GrayButton")
                transferButton.titleLabel?.textColor = UIColor(named: "DarkGrayText")
                transferButton.isEnabled = false
            } else {
                transferButton.backgroundColor = UIColor(named: "Primary")
                transferButton.titleLabel?.textColor = UIColor(ciColor: .white)
                transferButton.isEnabled = true
            }
        }
    }
}

extension TransferViewController: TransferView {
    func showReceiverData() {
        
    }
    
    func showAlertSuccess() {
        let successAlert = UIAlertController(title: "Transfer Success", message: "Transfer have been complited", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK ;)", style: .default, handler: { _ in
            self.presenter?.dissmisPage(vc: self)
        }))
        present(successAlert, animated: true, completion: nil)
    }
    
    func showError() {
        let successAlert = UIAlertController(title: "Transfer Failed", message: "Your transfer cannot be proceed", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK ;)", style: .default, handler: { _ in
            self.errorLabel.text = "Wrong Pin!"
            self.errorLabel.textColor = UIColor(ciColor: .red)
        }))
        present(successAlert, animated: true, completion: nil)
    }
    
}
