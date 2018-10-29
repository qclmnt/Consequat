//
//  QCCellViewModelTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 14/2/17.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCNavigation
@testable import QCViewModel

class QCCellViewModelTests: XCTestCase {
    
    // MARK: - reuseIdentifier
    func test_reuseIdentifier_shouldReturnEmptyString() {
        // Given
        let cellViewModel = QCCellViewModel()
        
        // When
        let reuseIdentifier = cellViewModel.reuseIdentifier
        
        // Then
        XCTAssertEqual(reuseIdentifier, "")
    }
    
    // MARK: - cellNib
    func test_cellNib_shouldReturnNil_whenReuseIdentifierIsNotAValidNibName() {
        // Given
        let cellViewModel = QCCellViewModel()
        
        // When
        let cellNib = cellViewModel.cellNib
        
        // Then
        XCTAssertNil(cellNib)
    }
   
}
