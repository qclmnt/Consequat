//
//  QCBasicHeaderCollectionReusableViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 07/02/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit

@objcMembers
open class QCBasicHeaderCollectionReusableViewModel: QCCollectionViewReusableViewModel {
    
    let text: String
    let style: QCCollectionReusableViewStyle
    
    // MARK: - Initialization
    
    public init(text: String,
         style: QCCollectionReusableViewStyle,
         supplementaryElementKind: String = UICollectionView.elementKindSectionHeader) {
        self.text = text
        self.style = style
        super.init(supplementaryElementKind: supplementaryElementKind)
    }
    
    // MARK: - QCCollectionViewReusableView

    override open var reuseIdentifier: String {
        return String(describing: QCBasicHeaderCollectionReusableView.self)
    }
    
    override open func viewSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: self.style.height)
    }
    
    override open func configureView(view: UICollectionReusableView) {
        if let headerView = view as? QCBasicHeaderCollectionReusableView {
            headerView.titleLabel.text = self.text
            headerView.configureWithStyle(style: self.style)
        }
    }
}
