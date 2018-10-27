//
//  QCMockCollectionViewReusableViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 15/2/17.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import Foundation
@testable import QCViewModel

class QCMockCollectionViewReusableViewModel: QCBasicHeaderCollectionReusableViewModel {
    
    var configureViewCalled = false
    override func configureView(view: UICollectionReusableView) {
        self.configureViewCalled = true
    }
    
    var registerCalled = false
    override func register(on collectionView: UICollectionView) {
        self.registerCalled = true
    }
    
}
