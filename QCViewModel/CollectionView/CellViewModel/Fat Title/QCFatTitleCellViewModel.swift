//
//  QCFatTitleCellViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 27/01/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit


open class QCFatTitleCellViewModel: QCCollectionCellViewModel {
    
    // MARK: - Properties
    
    public var title: String
    
    // MARK: - Initialization
    
    public init(title: String) {
        self.title = title
        
        super.init()
    }
    
    // MARK: - QCCellViewModel
    
    override open var reuseIdentifier: String {
        return String(describing: QCFatTitleCollectionViewCell.self)
    }
    
    override open func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        if let titleCell = cell as? QCFatTitleCollectionViewCell {
            titleCell.titleLabel.text = self.title
            titleCell.layoutIfNeeded()
        }
    }
    
}
