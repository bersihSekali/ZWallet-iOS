//
//  TransactionCell.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import UIKit
import Kingfisher

public class TransactionCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func showData(transaction: TransactionEntity) {
        self.nameLabel.text = transaction.name
        self.noteLabel.text = transaction.notes

        if transaction.type == "in" {
            self.amountLabel.text = "+\(transaction.amount.formatToIdr())"
            self.amountLabel.textColor = #colorLiteral(red: 0.1176470588, green: 0.7568627451, blue: 0.3725490196, alpha: 1)
        } else {
            self.amountLabel.text = "-\(transaction.amount.formatToIdr())"
            self.amountLabel.textColor = #colorLiteral(red: 1, green: 0.3568627451, blue: 0.2156862745, alpha: 1)
        }

        let url = URL(string: transaction.imageUrl)
        self.userImage.kf.setImage(with: url)
    }
    
}
