//
//  UIView+Extension.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 12/08/23.
//

import UIKit

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 1
    }
}
