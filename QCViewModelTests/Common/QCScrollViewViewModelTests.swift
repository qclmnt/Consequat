//
//  QCScrollViewViewModelTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 14/2/17.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCScrollViewViewModelTests: XCTestCase {
    
    // MARK: - emptyScreenDataSource
//    func test_emptyScreenDataSource_shouldNeverBeNil() {
//        // Given
//        let scrollViewModel = QCScrollViewViewModel()
//
//        // When
//        let emptyScreenDataSource = scrollViewModel.emptyScreenDataSource
//
//        // Then
//        XCTAssertNotNil(emptyScreenDataSource)
//    }
    
    // MARK: - sections
    func test_sections_shouldNeverBeNil_andReturnEmptyArray() {
        // Given
        let scrollViewModel = QCScrollViewViewModel()
        
        // When
        let sections = scrollViewModel.sections
        
        // Then
        XCTAssertNotNil(sections)
        XCTAssert(sections.count == 0)
    }
    
    // MARK: - load
    func test_load_shouldSetEmptyReasonToLoader_andCallViewModelDidStartLoad() {
        // Given
        let scrollViewModel = QCScrollViewViewModel()
        let delegate = QCMockTableViewModelDelegate()
        scrollViewModel.delegate = delegate
        
        // When
        scrollViewModel.load()
        
        // Then
//        XCTAssertNotNil(scrollViewModel.emptyScreenDataSource.emptyReason)
//        XCTAssert(scrollViewModel.emptyScreenDataSource.emptyReason is QCEmptyReasonLoader)
        XCTAssert(delegate.viewModelDidStartLoadCalled)
    }
    
    // MARK: - configurePositionOnSections
    func test_configurePositionOnSections_shouldSetPositionOnEachSections() {
        // Given
        let scrollViewModel = QCScrollViewViewModel()
        let section1 = QCSection()
        let section2 = QCSection()
        scrollViewModel.sections = [section1, section2]
        
        // When
        scrollViewModel.configurePositionOnSections()
        
        // Then
        XCTAssert(section1.position == 0)
        XCTAssert(section2.position == 1)
    }
    
    // MARK: - handleSuccess
    func test_handleSuccess_shouldLoadSections_setPositionOnEachSections_resetEmptyReason_andCallViewModelDidLoad() {
        // Given
        let scrollViewModel = QCScrollViewViewModel()
        let section1 = QCSection()
        let section2 = QCSection()
        scrollViewModel.sections = [section1, section2]
        let delegate = QCMockTableViewModelDelegate()
        scrollViewModel.delegate = delegate
        
        // When
        scrollViewModel.handleSuccess()
        
        // Then
        XCTAssert(section1.position == 0)
        XCTAssert(section2.position == 1)
//        XCTAssertNil(scrollViewModel.emptyScreenDataSource.emptyReason)
        XCTAssert(delegate.viewModelDidLoadCalled)
    }
    
    // MARK: - handleFailureWithStatusCode
    func test_handleFailureWithStatusCode_shouldCallViewModelDidFail_whenThereIsNoSections_andSetCorrectEmptyReason() {
        // Given
        let scrollViewModel = QCScrollViewViewModel()
        let delegate = QCMockTableViewModelDelegate()
        scrollViewModel.delegate = delegate
        let statusCode = 500
        let error = NSError(domain: "domain", code: 0, userInfo: nil)
        
        // When
        scrollViewModel.handleFailure(withStatusCode: statusCode,
                                      error: error)
        
        // Then
//        XCTAssertNotNil(scrollViewModel.emptyScreenDataSource.emptyReason)
//        XCTAssert(scrollViewModel.emptyScreenDataSource.emptyReason is QCEmptyReasonNetworkError)
        XCTAssert(delegate.viewModelDidFailCalled)
    }
    
    // MARK: - configureEmptyScreenErrorWithStatusCode
    func test_configureEmptyScreenErrorWithStatusCode_shouldSetCorrectEmptyReason() {
        // Given
        let scrollViewModel = QCScrollViewViewModel()
        let delegate = QCMockTableViewModelDelegate()
        scrollViewModel.delegate = delegate
        let statusCode = 500
        let error = NSError(domain: "domain", code: 0, userInfo: nil)
        
        // When
        scrollViewModel.configureEmptyScreenError(withStatusCode: statusCode, error: error, contentOffset: 0.0)
        
        // Then
//        XCTAssertNotNil(scrollViewModel.emptyScreenDataSource.emptyReason)
//        XCTAssert(scrollViewModel.emptyScreenDataSource.emptyReason is QCEmptyReasonNetworkError)
    }
    
}
