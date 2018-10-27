//
//  QCBasicFatBoldCollectionReusableViewStyleTests.swift
//  Quentin CLEMENTTests
//
//  Created by Quentin CLEMENT on 06/03/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCDeviceHelper
@testable import QCViewModel

class QCBasicFatBoldCollectionReusableViewStyleTests: XCTestCase {
    
    // MARK: - titleFont
    func test_titleFont_shouldBeBold70() {
        // Given
        let style = QCBasicFatBoldCollectionReusableViewStyle()
        let fontShouldBe = UIFont.systemFont(ofSize: 70*QCDeviceHelper.deviceWidthScale())
        
        // When
        let font = style.titleFont
        
        XCTAssertEqual(font.fontName, fontShouldBe.fontName)
        XCTAssertEqual(font.pointSize, fontShouldBe.pointSize)
    }
    
    // MARK: - titleAlignement
    func test_titleAlignement_shouldBeLeft() {
        // Given
        let style = QCBasicFatBoldCollectionReusableViewStyle()
        
        // When & Then
        XCTAssertEqual(style.titleAlignement, .left)
    }
    
    // MARK: - numberOfLines
    func test_numberOfLines_shouldBe0() {
        // Given
        let style = QCBasicFatBoldCollectionReusableViewStyle()
        
        // When
        XCTAssertEqual(style.numberOfLines, 0)
    }
    
    // MARK: - height
    func test_height_shouldBe200() {
        // Given
        let style = QCBasicFatBoldCollectionReusableViewStyle()
        
        // When
        XCTAssertEqual(style.height, 200)
    }
    
}
