//
//  ProductTableViewCell.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 12/08/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var lbl : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func loadCellData(product : ProductModel?) {
        lbl.text = product?.title
    }
}
