//
//  QCBasicBoldCollectionReusableViewStyleTests.swift
//  Quentin CLEMENTTests
//
//  Created by Quentin CLEMENT on 07/02/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCBasicBoldCollectionReusableViewStyleTests: XCTestCase {
    
    // MARK: - titleFont
    func test_titleFont_shouldReturnBlack() {
        
        // Given & When & Then
        XCTAssertEqual(QCBasicBoldCollectionReusableViewStyle().titleFont.fontName, UIFont.systemFont(ofSize: 13).fontName)
    }
    
    // MARK: - titleColor
    func test_titleColor_shouldReturnBlack() {
        
        // Given & When & Then
        XCTAssertEqual(QCBasicBoldCollectionReusableViewStyle().titleColor, UIColor.black)
    }
    
}
