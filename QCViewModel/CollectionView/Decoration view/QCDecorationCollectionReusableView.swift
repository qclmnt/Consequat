//
//  QCDecorationCollectionReusableView.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 25/04/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class QCDecorationCollectionReusableView: UICollectionReusableView {
    
    func configure(viewModel: QCDecorationCollectionReusableViewModel) {
        self.backgroundColor = viewModel.color
    }
    
}
