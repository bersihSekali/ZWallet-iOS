//
//  DashboardCell.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import UIKit

class DashboardCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    var delegate: DashboardCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func showData(userProfile: UserProfileEntity) {
        self.nameLabel.text = userProfile.name
        self.balanceLabel.text = userProfile.balance.formatToIdr()
        self.phoneNumberLabel.text = userProfile.phoneNumber

        let url = URL(string: userProfile.imageUrl)
        self.profileImage.kf.setImage(with: url)
    }

    @IBAction func showTransactionAction(_ sender: Any) {
        self.delegate?.showAllTransaction()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        self.delegate?.logout()
    }
    
    
    @IBAction func transferButtonAction(_ sender: Any) {
        self.delegate?.showTransfer()
    }
    
    
}
