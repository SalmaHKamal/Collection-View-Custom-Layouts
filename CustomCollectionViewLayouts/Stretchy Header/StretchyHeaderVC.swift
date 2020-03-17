//
//  StretchyHeaderVC.swift
//  CustomCollectionViewLayouts
//
//  Created by Salma Hassan on 3/12/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class StretchyHeaderVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let imageCellId = "imageCell"
    let labelCellId = "labelCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        
        collectionView.register(UINib(nibName: String(describing: ImageCollectionViewCell.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: imageCellId)
        collectionView.register(UINib(nibName: String(describing: LabelCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: labelCellId)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.headerReferenceSize = CGSize(width: collectionView.frame.width, height: 180)
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 60)
    }

}

extension StretchyHeaderVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: labelCellId, for: indexPath) as? LabelCollectionViewCell else { return UICollectionViewCell() }
        cell.label.text = String(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: imageCellId, for: indexPath) as? ImageCollectionViewCell else { return UICollectionReusableView() }
        
        return cell
    }
    
    
}
