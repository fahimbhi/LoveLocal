//
//  ShopTableViewCell.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 12/08/23.
//

import UIKit

class ShopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var shopIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.addShadow()
        self.bgView.layer.cornerRadius = 10
    }

    func configure(title: String, icon: String) {
        shopIcon.image = UIImage(named: icon)
        titleLbl.text = title
    }
}
