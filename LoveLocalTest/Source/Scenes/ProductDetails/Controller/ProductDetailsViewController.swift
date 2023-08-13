//
//  ProductDetailsViewController.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 13/08/23.
//

import UIKit
import SDWebImage

class ProductDetailsViewController: UIViewController {

    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var decp: UILabel!
    @IBOutlet var productCollectionView: UICollectionView!
    @IBOutlet var pack1Btn: UIButton!
    @IBOutlet var pack2Btn: UIButton!
    @IBOutlet var pack3Btn: UIButton!
    @IBOutlet var addCartBtn: UIButton!
    
    var data: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProduct()
        configureCell()
        configureButton()
    }
    
    func configureProduct() {
        headingLabel.text = data?.title ?? ""
        titleLabel.text = data?.title ?? ""
        priceLabel.text = "₹\(data?.price ?? 0)"
        decp.text = data?.desc ?? ""
        if let urlString = data?.image, let url = URL(string: urlString) {
            productImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    func configureCell() {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        productCollectionView!.collectionViewLayout = layout
        productCollectionView.reloadData()
    }
    
    func configureButton() {
        pack1Btn.layer.cornerRadius = 8;
        pack1Btn.layer.masksToBounds = true;
        pack1Btn.layer.borderColor = UIColor(red:184/255, green:35/255,blue:142/255, alpha: 1).cgColor
        pack1Btn.layer.borderWidth = 1;
        
        pack2Btn.layer.cornerRadius = 8;
        pack2Btn.layer.masksToBounds = true;
        pack2Btn.layer.borderColor = UIColor(red:184/255, green:35/255,blue:142/255, alpha: 1).cgColor
        pack2Btn.layer.borderWidth = 1;
        
        pack3Btn.layer.cornerRadius = 8;
        pack3Btn.layer.masksToBounds = true;
        pack3Btn.layer.borderColor = UIColor(red:184/255, green:35/255,blue:142/255, alpha: 1).cgColor
        pack3Btn.layer.borderWidth = 1;

        addCartBtn.layer.cornerRadius = 8
    }


    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}

extension ProductDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create the cell and return the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:152, height: 312)
    }
}

