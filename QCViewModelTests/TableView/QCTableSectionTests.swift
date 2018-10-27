//
//  QCTableSectionTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 5/12/16.
//  Copyright © 2016 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCTableSectionTests: XCTestCase {
    
    // MARK: - reloadItemsInSection
    func test_reloadItemsInSection_shouldResetItems() {
        // Given
        let tableSection = QCTableSection()
        
        // When
        tableSection.reloadItemsInSection()
        
        // Then
        XCTAssertNotNil(tableSection.items)
        XCTAssert(tableSection.items.count == 0)
    }
    
    
    // MARK: - heightForHeader
    func test_heightForHeader_shouldBeEqualToZeroDotOne() {
        // Given
        let section = QCTableSection()
        
        // When
        let headerHeight = section.heightForHeader
        
        // Then
        XCTAssert(headerHeight == 0.1)
    }
    
    // MARK: - heightForFooter
    func test_heightForFooter_shouldBeEqualToZeroDotOne() {
        // Given
        let section = QCTableSection()
        
        // When
        let footerHeight = section.heightForFooter
        
        // Then
        XCTAssert(footerHeight == 0.1)
    }
    
    // MARK: - items
    func test_items_shouldNeverBeNil() {
        // Given
        let section = QCTableSection()
        
        // When
        let items = section.items
        
        // Then
        XCTAssertNotNil(items)
        XCTAssert(items.count == 0)
    }

}
