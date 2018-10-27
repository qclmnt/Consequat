//
//  QCCollectionCellViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 23/01/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit

import QCNavigation

open class QCCollectionCellViewModel: QCCellViewModel {
    
    // MARK: - Properties
    
    public var cellForSize: UICollectionViewCell?
    
    open func cellSize(maxSize: CGSize) -> CGSize {
        
        if self.cellForSize == nil,
            self.reuseIdentifier.count > 0,
            let cell = self.bundleForNib.loadNibNamed(self.reuseIdentifier, owner: self, options: nil)?.first as? UICollectionViewCell {
            
            self.cellForSize = cell
        }
        
        guard let cell = self.cellForSize else {
            return CGSize.zero
        }
        
        cell.prepareForReuse()
        
        cell.frame = CGRect(x: cell.frame.origin.x,
                            y: cell.frame.origin.y,
                            width: maxSize.width,
                            height: cell.frame.size.height)
        self.configureCell(cell, collectionView: nil)
        
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        var finalSize = CGSize(width: maxSize.width, height: cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height)
        
        if finalSize.height > maxSize.height {
            finalSize.height = maxSize.height
        }
        
        return finalSize
    }
    
    open func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        // Override in subclasses
    }
    
    open func willDisplayCell(_ cell: UICollectionViewCell) {
        // Override in subclasses
    }
    
    open func didEndDisplaying(_ cell: UICollectionViewCell) {
        // Override in subclasses
    }
    
    // MARK: - QCCellViewModel
    
    func registerCell(_ collectionView: UICollectionView) {
        collectionView.register(self.cellNib,
                                forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
}
