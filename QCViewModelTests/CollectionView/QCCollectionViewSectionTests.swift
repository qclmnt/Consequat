//
//  QCCollectionViewSectionTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 14/02/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCDeviceHelper
@testable import QCViewModel

class QCCollectionViewSectionTests: XCTestCase {
    
    // MARK: - edgeInsets
    func test_edgeInsets_shouldReturnCorrectValue() {
        // Given
        let collectionSection = QCCollectionViewSection()
        
        // When
        let edgeInsets = collectionSection.edgeInsets
        
        // Then
        if QCDeviceHelper.isIpad() {
            XCTAssertEqual(edgeInsets.top, 4)
            XCTAssertEqual(edgeInsets.left, 8)
            XCTAssertEqual(edgeInsets.bottom, 4)
            XCTAssertEqual(edgeInsets.right, 8)
        } else {
            XCTAssertEqual(edgeInsets, UIEdgeInsets.zero)
        }
    }
    
    // MARK: - numberOfColumns
    func test_numberOfColumns_shouldReturnOne() {
        // Given
        let collectionSection = QCCollectionViewSection()
        
        // When
        let nbColumns = collectionSection.numberOfColumns
        
        // Then
        if QCDeviceHelper.isIpad() {
            XCTAssert(nbColumns == 3)
        } else {
            XCTAssert(nbColumns == 1)
        }
    }
    
    // MARK: - minimumLineSpacing
    func test_minimumLineSpacing_shouldReturnZero() {
        // Given
        let collectionSection = QCCollectionViewSection()
        
        // When
        let minimumLineSpacing = collectionSection.minimumLineSpacing
        
        //  Then
        if QCDeviceHelper.isIpad() {
            XCTAssert(minimumLineSpacing == 8)
        } else {
            XCTAssert(minimumLineSpacing == 0)
        }
    }
    
    // MARK: - minimumInteritemSpacing
    func test_minimumInteritemSpacing_shouldReturnZero() {
        // Given
        let collectionSection = QCCollectionViewSection()
        
        // When
        let minimumInteritemSpacing = collectionSection.minimumInteritemSpacing
        
        // Then
        if QCDeviceHelper.isIpad() {
            XCTAssert(minimumInteritemSpacing == 8)
        } else {
            XCTAssert(minimumInteritemSpacing == 0)
        }
    }

}
