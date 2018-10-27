//
//  QCCollectionViewFlowLayoutTests.swift
//  Quentin CLEMENTTests
//
//  Created by Quentin CLEMENT on 22/02/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCCollectionViewFlowLayoutTests: XCTestCase {
    
    // MARK: - shouldInvalidateLayout
    func test_shouldInvalidateLayout_shouldReturnTrue() {
        // Given
        let flowLayout = QCCollectionViewFlowLayout()
        
        // When & Then
        XCTAssert(flowLayout.shouldInvalidateLayout(forBoundsChange: CGRect.zero))
    }
}
