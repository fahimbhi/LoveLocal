//
//  MediaCollectionViewCell.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 13/08/23.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mediaimage: UIImageView!
    
    static let identifier = "MediaCollectionViewCell"
    static func nib()->UINib{
        return UINib(nibName: "MediaCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mediaimage.layer.cornerRadius = 16
        mediaimage.layer.masksToBounds = true;
    }

}
