//
//  QCBasicHeaderCollectionReusableView.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 07/02/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit

class QCBasicHeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Style configuration
    
    func configureWithStyle(style: QCCollectionReusableViewStyle) {
        self.titleLabel.font = style.titleFont
        self.titleLabel.textColor = style.titleColor
        self.titleLabel.textAlignment = style.titleAlignement
        self.titleLabel.numberOfLines = style.numberOfLines
        self.backgroundColor = style.backgroundColor
    }
}
