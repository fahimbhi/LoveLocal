//
//  ViewController.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 12/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView : UITableView!
    private var storeViewModel: StoreViewModel = StoreViewModel()
    
//    let coreDataManager = CoreDataManager()
//    let productVM = ProductViewModel()
//    var model = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Stores"
        registerCell()
    }
    
    private func navigateToShopDetailsVC(data: ShopModel) {
        let shopDetailsVC = StoreDetailsViewController()
        shopDetailsVC.shopIcon = data.icon
        shopDetailsVC.shopTitle = data.title
        navigationController?.pushViewController(shopDetailsVC, animated: true)
    }
    
//    func loadData() {
//        productVM.getProducts {
//            DispatchQueue.main.async {
//                self.fetchSavedData()
//            }
//        }
//    }
//
//    func fetchSavedData() {
//        model = coreDataManager.retrieveData()
//        self.tblView.reloadData()
//    }
    
    func registerCell() {
        tblView.register(UINib(nibName: "ShopTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopTableViewCell")
//        tblView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 212
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeViewModel.shops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tblView.dequeueReusableCell(withIdentifier: "ShopTableViewCell") as? ShopTableViewCell {
//            cell.loadCellData(product: productVM.productData?[indexPath.row])
            cell.configure(title: storeViewModel.shops[indexPath.row].title ?? "", icon: storeViewModel.shops[indexPath.row].icon ?? "")
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToShopDetailsVC(data: storeViewModel.shops[indexPath.row])
    }
}

