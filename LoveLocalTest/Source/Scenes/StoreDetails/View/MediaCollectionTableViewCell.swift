//
//  MediaCollectionTableViewCell.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 13/08/23.
//

import UIKit

class MediaCollectionTableViewcell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var customPageControl: UIPageControl!
    @IBOutlet weak var mediaCollectionView: UICollectionView!
    static let identifier = "MediaCollectionTableViewcell"
    static func nib()->UINib{
        return UINib(nibName: "MediaCollectionTableViewcell", bundle: nil)
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mediaCollectionView.register( MediaCollectionViewCell.nib(), forCellWithReuseIdentifier:  MediaCollectionViewCell.identifier)
        mediaCollectionView.delegate = self
        mediaCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        mediaCollectionView.collectionViewLayout = layout
        mediaCollectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.85, height: 180)
        }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaCollectionViewCell", for: indexPath) as!  MediaCollectionViewCell
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / (UIScreen.main.bounds.width * 0.85))
        customPageControl.currentPage = currentPage
    }
    
}
