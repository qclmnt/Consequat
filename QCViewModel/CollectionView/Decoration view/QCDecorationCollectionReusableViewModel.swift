//
//  QCDecorationCollectionReusableViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 25/04/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

open class QCDecorationCollectionReusableViewModel: QCCollectionViewReusableViewModel {
    
    static let decorationViewOfKind = "decorationViewOfKind"
    var decorationViewInfos: QCDecorationViewInfos?
    
    let color: UIColor
    
    // MARK: - Initialization
    
    public init(color: UIColor) {
        self.color = color
        super.init(supplementaryElementKind: QCDecorationCollectionReusableViewModel.decorationViewOfKind)
    }
    
    public init () {
        self.color = .clear
        super.init(supplementaryElementKind: QCDecorationCollectionReusableViewModel.decorationViewOfKind)
    }
    
    // MARK: - QCCollectionViewReusableViewModel
    
    override open var reuseIdentifier: String {
        return String(describing: QCDecorationCollectionReusableView.self)
    }
    
    override open func viewSize(maxSize: CGSize) -> CGSize {
        return maxSize
    }
    
    override func register(on collectionView: UICollectionView) {
        collectionView.collectionViewLayout.register(self.viewNib, forDecorationViewOfKind: QCDecorationCollectionReusableViewModel.decorationViewOfKind)
    }

}
