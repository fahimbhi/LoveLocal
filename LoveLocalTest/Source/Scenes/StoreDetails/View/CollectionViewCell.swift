//
//  CollectionViewCell.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 13/08/23.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var kilogramView: UIView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var price: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var baseView: UIView!
    
    static let identifier = "CollectionViewCell"
    static func nib()->UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        kilogramView.layer.cornerRadius = 8;
        kilogramView.layer.masksToBounds = true;
        kilogramView.layer.borderColor = UIColor(red:229/255, green:229/255,blue:229/255, alpha: 1).cgColor
        kilogramView.layer.borderWidth = 0.5;
        kilogramView.layer.shadowColor = UIColor.black.cgColor
        kilogramView.layer.shadowOffset = CGSizeZero;
        kilogramView.layer.shadowRadius = 1.0;
        kilogramView.layer.shadowOpacity = 0.5;
        kilogramView.layer.masksToBounds = false;
        kilogramView.clipsToBounds = false;
        
        addBtn.layer.cornerRadius = 8;
        addBtn.layer.masksToBounds = true;
        addBtn.layer.borderColor = UIColor(red:184/255, green:35/255,blue:142/255, alpha: 1).cgColor
        addBtn.layer.borderWidth = 1;

        
        baseView.layer.cornerRadius = 16;
        baseView.layer.masksToBounds = true;
        baseView.layer.borderColor = UIColor(red:229/255, green:229/255,blue:229/255, alpha: 1).cgColor
        baseView.layer.borderWidth = 0.5;
    }
    
    func configureData(title: String, price: String, icon: String) {
        self.titleLabel.text = title
        self.price.text = price
        if let imageUrl = URL(string: icon) {
            image.sd_setImage(with: imageUrl, completed: nil)
        }
    }
    
}
