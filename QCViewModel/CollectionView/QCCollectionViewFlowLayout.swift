//
//  QCCollectionViewFlowLayout.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 22/02/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

public class QCCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    lazy var decorationsInfos = [NSIndexPath: QCDecorationViewInfos]()
    lazy var decorationAttributes = [NSIndexPath: UICollectionViewLayoutAttributes]()
    lazy var sectionsSizes = [NSIndexPath: CGSize]()
    lazy var sectionsLeftInset = [NSIndexPath: CGFloat]()
    
    // To fix bug when we change the layout without invalidating the layout
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard self.collectionView?.dataSource != nil else {return nil}
        
        var attributes = super.layoutAttributesForElements(in: rect)
        
        guard let collectionView = self.collectionView else { return attributes }
        
        let numberOfSections = collectionView.numberOfSections
        var xOrYOffset = CGFloat(0)
        
        for sectionNumber in 0 ..< numberOfSections {
            let indexPath = IndexPath(row: 0, section: sectionNumber)
            var sectionSize = CGSize.zero
            if let size = self.sectionsSizes[indexPath as NSIndexPath] {
                sectionSize = size
            }
            var leftInset = CGFloat(0)
            if let inset = self.sectionsLeftInset[indexPath as NSIndexPath] {
                leftInset = inset
            }
            let decorationAttribute = UICollectionViewLayoutAttributes(forDecorationViewOfKind: QCDecorationCollectionReusableViewModel.decorationViewOfKind, with: indexPath)
            decorationAttribute.zIndex = -1
            
            
            if self.scrollDirection == .vertical {
                decorationAttribute.frame = CGRect(x: leftInset, y: xOrYOffset, width: sectionSize.width, height: sectionSize.height)
            } else {
                // Scroll horizontal
                // To implement if needed
            }
            
            xOrYOffset += sectionSize.height
            
            attributes?.append(decorationAttribute)
            self.decorationAttributes[indexPath as NSIndexPath] = decorationAttribute
        }
        
        return attributes
    }
    
    override public func prepare() {
        super.prepare()
        guard let collectionView = self.collectionView else { return }
        
        if self.scrollDirection == .vertical {
            let numberOfSections = collectionView.numberOfSections
            for sectionNumber in 0 ..< numberOfSections {
                let numberOfCells = collectionView.numberOfItems(inSection: sectionNumber)
                var sectionSize = CGSize.zero
                let indexPath = NSIndexPath(row: 0, section: sectionNumber)
                
                if let decorationInfos = self.decorationsInfos[indexPath] {
                    sectionSize = decorationInfos.decorationSize(numberOfItems: numberOfCells)
                    self.sectionsLeftInset[indexPath] = decorationInfos.sectionEdgeInsets.left
                }
                
                self.sectionsSizes[indexPath] = sectionSize
            }
        } else {
            // Scroll horizontal
            // To implement if needed
        }
    }
    
}
