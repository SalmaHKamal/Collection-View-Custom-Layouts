//
//  stickeyHeaderVC.swift
//  CustomCollectionViewLayouts
//
//  Created by Salma Hassan on 3/13/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class stickeyHeaderVC: UIViewController {

    @IBOutlet weak var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: String(describing: CollectionCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CollectionCell.self))
        
//        collectionView.register(UINib(nibName: String(describing: HeaderReusableView.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: HeaderReusableView.self))
        
        collectionView.register(UINib(nibName: String(describing: CollectionCell.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: CollectionCell.self))
        
        guard let layout = collectionView.collectionViewLayout as? StickyHeaderLayout else { return }
        layout.itemSize = CGSize(width: collectionView.frame.width , height: 60)
        layout.headerReferenceSize = CGSize(width: collectionView.frame.width , height: 80)
    }

}


extension stickeyHeaderVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionCell.self), for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
       
        cell.label.text = String(indexPath.row)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: CollectionCell.self), for: indexPath) as? CollectionCell else { return UICollectionReusableView() }
        
        cell.label.text = String(indexPath.section)
        cell.backgroundColor = .brown
        return cell
    }
    
}
