//
//  DIYLayout.swift
//  CustomCollectionViewLayouts
//
//  Created by Salma Hassan on 3/12/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class DIYLayout : UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView
            , let attributes = super.layoutAttributesForElements(in: rect)
        else { return nil }
        
        let offset = collectionView.contentOffset
        print(offset)
        if offset.y < 0 {
            let deltaY = abs(offset.y)
            for attribute in attributes {
                if attribute.representedElementKind == UICollectionView.elementKindSectionHeader {
                    var frame = attribute.frame
                    print("frame before " , frame)
                    frame.size.height = max(0, headerReferenceSize.height + deltaY)
                    frame.origin.y = frame.minY - deltaY
                    attribute.frame = frame
                    
                    print("frame after " , frame , "deltaY = " , deltaY)
                }
            }
        }
        
        return attributes
    }
}
