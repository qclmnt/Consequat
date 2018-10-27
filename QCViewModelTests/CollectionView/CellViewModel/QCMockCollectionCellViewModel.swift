//
//  QCMockCollectionCellViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 15/2/17.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import Foundation
@testable import QCViewModel

class QCMockCollectionCellViewModel: QCCollectionCellViewModel {
    
    // Allows to have a real cell when testing
    override var reuseIdentifier: String {
        return String(describing: QCMockCollectionCell.self)
    }
    
    var willDisplayCellCalled = false
    override func willDisplayCell(_ cell: UICollectionViewCell) {
        self.willDisplayCellCalled = true
    }
    
    var configureCellCalled = false
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        self.configureCellCalled = true
    }
    
    var didSelectCalled = false
    override func didSelect(fromVC: UIViewController?) {
        self.didSelectCalled = true
    }
    
    var cellSizeCalled = false
    override func cellSize(maxSize: CGSize) -> CGSize {
        self.cellSizeCalled = true
        return CGSize(width: 50, height: 50)
    }
    
    var registerCellCalled = false
    override func registerCell(_ collectionView: UICollectionView) {
        self.registerCellCalled = true
        super.registerCell(collectionView)
    }
}
