//
//  QCRoutingEntryTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 14/10/16.
//  Copyright © 2016 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCNavigation

class QCRoutingEntryTests: XCTestCase {
    
    // MARK: - viewController
    func test_viewController_shouldReturnNil() {
        // Given
        let routingEntry = QCMockRoutingEntry()
        
        // When
        let viewController = routingEntry.viewController
        
        // Then
        XCTAssertNil(viewController)
    }
    
    // MARK: - navigationstyle
    func test_navigationStyle_shouldBePush() {
        // Given
        let routingEntry = QCMockRoutingEntry()
        
        // When
        let navigationStyle = routingEntry.navigationStyle
        
        // Then
        XCTAssert(navigationStyle == QCNavigationStyle.push)
    }
    
    // MARK: - animated
    func test_animated_shouldBeTrue() {
        // Given
        let routingEntry = QCMockRoutingEntry()
        
        // When
        let animated = routingEntry.animated
        
        // Then
        XCTAssert(animated)
    }
    
    // MARK: - url
    func test_url_shouldBeNil() {
        // Given
        let routingEntry = QCMockRoutingEntry()
        
        // When
        let url = routingEntry.url
        
        // Then
        XCTAssertNil(url)        
    }
    
}
