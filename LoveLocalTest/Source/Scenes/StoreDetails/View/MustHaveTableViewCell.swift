//
//  MustHaveTableViewCell.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 13/08/23.
//

import UIKit

class MustHaveTableViewCell: UITableViewCell {
    
    static let identifier = "MustHaveTableViewCell"
    static func nib()->UINib{
        return UINib(nibName: "MustHaveTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
