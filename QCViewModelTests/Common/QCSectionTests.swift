//
//  QCSectionTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 14/02/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCSectionTests: XCTestCase {
    
    // MARK: - reloadItemsInSection
    func test_reloadItemsInSection_shouldResetItems() {
        
        // Given
        let collectionSection = QCSection()
        collectionSection.items.append(QCCellViewModel())
        
        // When
        collectionSection.reloadItemsInSection()
        
        // Then        
        XCTAssertNotNil(collectionSection.items)
        XCTAssert(collectionSection.items.count == 0)
    }
    
    // MARK: - items
    func test_items_shouldNotBeNil() {        
        // Given
        let collectionSection = QCSection()
        
        // When & Then
        XCTAssertNotNil(collectionSection.items)
    }
    
}
