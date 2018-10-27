//
//  QCFatTitleSectionTests.swift
//  Quentin CLEMENTTests
//
//  Created by Quentin CLEMENT on 07/02/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel
@testable import QCDeviceHelper

class QCFatTitleSectionTests: XCTestCase {
    
    // MARK: - init
    func test_init_shouldSetProperty() {
        
        // Given
        let title = "title"
        
        // When
        let section = QCFatTitleSection(title: title)
        
        // Then
        XCTAssertEqual(section.title, title)
    }
    
    // MARK: - init title:verticalEdgeInsets:horizontalEdgeInsets:
    func test_init_title_edgeInsets_shouldSetProperty() {
        
        // Given
        let title = "title"
        let verticalEdgeInsets = CGFloat(10)
        let horizontalEdgeInsets = CGFloat(10)
        
        // When
        let section = QCFatTitleSection(title: title, verticalEdgeInsets: verticalEdgeInsets, horizontalEdgeInsets: horizontalEdgeInsets)
        
        // Then
        XCTAssertEqual(section.title, title)
        XCTAssertEqual(section.verticalEdgeInsets, verticalEdgeInsets)
        XCTAssertEqual(section.horizontalEdgeInsets, horizontalEdgeInsets)
    }
    
    // MARK: - edgeInsets
    
    func test_edgeInsets_shouldReturnZero() {
        
        // Given
        let title = "title"
        let section = QCFatTitleSection(title: title)
        
        // When
        let edgeInsets = section.edgeInsets
        
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
    
    func test_edgeInsets_shouldReturnEdgeInsetWithInitValues() {
        
        // Given
        let title = "title"
        let verticalEdgeInsets = CGFloat(10)
        let horizontalEdgeInsets = CGFloat(10)
        let section = QCFatTitleSection(title: title, verticalEdgeInsets: verticalEdgeInsets, horizontalEdgeInsets: horizontalEdgeInsets)
        
        // When
        let edgeInsets = section.edgeInsets
        
        // Then
        XCTAssertEqual(edgeInsets.bottom, verticalEdgeInsets)
        XCTAssertEqual(edgeInsets.top, verticalEdgeInsets)
        XCTAssertEqual(edgeInsets.left, horizontalEdgeInsets)
        XCTAssertEqual(edgeInsets.right, horizontalEdgeInsets)
    }
    
    // MARK: - setup
    func test_setup_shouldHave1Item() {
        
        // Given
        let title = "title"
        let section = QCFatTitleSection(title: title)
        
        // When
        section.setup()
        
        // Then
        XCTAssertEqual(section.items.count, 1)
    }
    
}
