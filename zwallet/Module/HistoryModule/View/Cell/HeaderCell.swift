//
//  HeaderCell.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import UIKit

class HeaderCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setTitle(title: String) {
        self.titleLabel.text = title
    }
    
}
