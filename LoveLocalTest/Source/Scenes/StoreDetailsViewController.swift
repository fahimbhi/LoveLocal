//
//  StoreViewController.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 12/08/23.
//

import UIKit

class StoreDetailsViewController: UIViewController, Storyboarded {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var storeDetailsTableView: UITableView!
    
    let storeDetailsViewModel =  StoreDetailsViewModel()
    let coreDataManager = CoreDataManager()
    
    var shopTitle: String?
    var shopIcon: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configureTableView()
        configureSearchBar()
        storeDetailsViewModel.load()
        bindData()
    }
    
    private func setUpView() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configureTableView() {
        storeDetailsTableView.delegate = self
        storeDetailsTableView.dataSource = self
        storeDetailsTableView.register(UINib(nibName: "ShopTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopTableViewCell")
        storeDetailsTableView.register(UINib(nibName: "ShopAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopAddressTableViewCell")
        storeDetailsTableView.register(UINib(nibName: "ProductCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCollectionTableViewCell")
        storeDetailsTableView.register(MustHaveTableViewCell.nib(), forCellReuseIdentifier: MustHaveTableViewCell.identifier)
        storeDetailsTableView.register(MediaCollectionTableViewcell.nib(), forCellReuseIdentifier: MediaCollectionTableViewcell.identifier)
    }
    
    private func configureSearchBar() {
        self.searchBar.delegate = self
        self.searchBar.searchTextField.backgroundColor = .clear
        self.searchBar.layer.cornerRadius = 10
        self.searchBar.layer.masksToBounds = true
    }
    
    private func bindData() {
        storeDetailsViewModel.shopProduct.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.storeDetailsTableView.reloadData()
            }
        }
    }
    
    @objc func searchItem(_ searchText: String) {
        self.storeDetailsViewModel.searchProduct(searchText)
    }
    
    func navigateToProductDetailsVC(data: Product) {
        let productDetailsVC = ProductDetailsViewController()
        productDetailsVC.data = data
        navigationController?.pushViewController(productDetailsVC, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension StoreDetailsViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 212
        case 1:
            return 68
        case 2:
            return 325
        case 3:
            return 250
        case 4:
            return 152
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableViewCell", for: indexPath) as? ShopTableViewCell
            cell?.configure(title: shopTitle ?? "", icon: shopIcon ?? "")
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MustHaveTableViewCell", for: indexPath) as? MustHaveTableViewCell
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCollectionTableViewCell", for: indexPath) as? ProductCollectionTableViewCell
            cell?.shopProducts = storeDetailsViewModel.shopProduct.value
            cell?.callback = {index in
                if let selectedProduct = self.storeDetailsViewModel.shopProduct.value?[index] {
                    self.navigateToProductDetailsVC(data: selectedProduct)
                }
            }
            cell?.configureCell()
            return cell ?? UITableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCollectionTableViewcell", for: indexPath) as? MediaCollectionTableViewcell
            return cell ?? UITableViewCell()
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopAddressTableViewCell", for: indexPath) as? StoreAddressTableViewCell
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

extension StoreDetailsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            print("Search text: \(searchText)")
        }
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchItem(_:)), object: searchText)
        self.searchItem(searchText)
    }
}
