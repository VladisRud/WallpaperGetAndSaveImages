//
//  TestUICollectionViewLayout.swift
//  ImageGetAndSaveVladisRud
//
//  Created by Влад Руденко on 10.06.2022.
//

import UIKit

class TestUICollectionViewLayout: UICollectionViewLayout {
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        
        return [UICollectionViewLayoutAttributes]()
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        
        return UICollectionViewLayoutAttributes(forCellWith: indexPath)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return false
    }
    
    
}
