//
//  StickyHeaderLayout.swift
//  CustomCollectionViewLayouts
//
//  Created by Salma Hassan on 3/13/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class StickyHeaderLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard var layoutAttributes = super.layoutAttributesForElements(in: rect) ,
        let collectionView = collectionView
            else { return nil }
        
        let headerNeedingLayout = NSMutableIndexSet()
        layoutAttributes.forEach { (attribute) in
            if attribute.representedElementCategory == .cell {
                headerNeedingLayout.add(attribute.indexPath.section)
            }
        }
        
        print("array after first loop => " , headerNeedingLayout)
        
        layoutAttributes.forEach { (attribute) in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader {
                headerNeedingLayout.remove(attribute.indexPath.section)
            }
        }
        
        print("array after second loop => " , headerNeedingLayout)
        
        headerNeedingLayout.enumerate(options: []) { (index, stop) in
            let indexPath = IndexPath(item: 0, section: index)
            guard let attributes = self.layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: indexPath) else { return }
            layoutAttributes.append(attributes)
        }
        
//        print("array after third loop => " , headerNeedingLayout)
        
        
        layoutAttributes.forEach { (attribute) in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader {
                let section = attribute.indexPath.section
                guard let attributesForFirstItemInSection = layoutAttributesForItem(at: IndexPath(item: 0, section: section)) ,
                let attributesForLastItemInSection = layoutAttributesForItem(at: IndexPath(item: collectionView.numberOfItems(inSection: section) - 1, section: section))
                
                    else { return }
                
                var frame = attribute.frame
                let offset = collectionView.contentOffset.y
                let minY = attributesForFirstItemInSection.frame.minY - frame.height
                let maxY = attributesForLastItemInSection.frame.maxY - frame.height
                
                let y = min(max(offset, minY), maxY)
                
                frame.origin.y = y
                attribute.frame = frame
                attribute.zIndex = 99
            }
        }
        
        return layoutAttributes
    }
}
