//
//  QCCollectionCellViewModelTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 14/2/17.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCCollectionCellViewModelTests: XCTestCase {
    
    // MARK: - cellSize
    func test_cellSize_shouldReturnCGSizeZero_whenReuseIdentifierIsNotAValidNibName() {
        // Given
        let collectionCellViewModel = QCCollectionCellViewModel()
        let maxSize = CGSize(width: 200, height: 200)
        
        // When
        let cellSize = collectionCellViewModel.cellSize(maxSize: maxSize)
        
        // Then
        XCTAssert(cellSize.equalTo(CGSize.zero))
    }
    
}
