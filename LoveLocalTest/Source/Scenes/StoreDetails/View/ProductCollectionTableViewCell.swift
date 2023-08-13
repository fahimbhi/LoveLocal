//
//  ProductCollectionTableViewCell.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 13/08/23.
//

import UIKit

class ProductCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var productCollectionView: UICollectionView!
    
    var shopProducts: [Product]?
    var callback: ((Int)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell() {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        productCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        productCollectionView.reloadData()
        if (shopProducts?.isEmpty ?? true)  {
            productCollectionView.setEmptyView(title: "", message: "No items")
        }else {
            productCollectionView.restore()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopProducts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create the cell and return the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.configureData(title: (shopProducts?[indexPath.row].title ?? ""), price: "₹\(shopProducts?[indexPath.row].price ?? 0)", icon: shopProducts?[indexPath.row].image ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:152, height: 312)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        callback?(indexPath.row)
    }
    
}
