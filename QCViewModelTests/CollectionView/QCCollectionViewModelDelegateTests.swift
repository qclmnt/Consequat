//
//  QCCollectionViewModelDelegateTests.swift
//  Quentin CLEMENTTests
//
//  Created by Quentin CLEMENT on 07/03/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCCollectionViewModelDelegateTests: XCTestCase {
    
    // MARK: - numberOfRowTotal
    func test_numberOfRowTotal_shouldReturn10() {
        
        // Given
        let delegate = QCMockCollectionViewModelDelegate()
        delegate.mockCollectionView = QCMockCollectionView(frame: CGRect(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: UICollectionViewLayout())
        delegate.mockCollectionView?.mockNumberOfItems = 1
        delegate.mockCollectionView?.mockNumberOfSections = 10
        
        // Then
        XCTAssertEqual(delegate.numberOfRowTotal(collectionView: delegate.mockCollectionView!), 10)
    }
    
    // MARK: - indexPaths
    func test_indexPaths_shouldReturn5() {
        
        // Given
        let delegate = QCMockCollectionViewModelDelegate()
        delegate.mockCollectionView = QCMockCollectionView(frame: CGRect(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: UICollectionViewLayout())
        var indexPaths = [IndexPath]()
        for i in 0...4 {
            indexPaths.append(IndexPath(row: i, section: 0))
        }
        
        // When & Then
        XCTAssertEqual(delegate.indexPaths(section: 0, indexPaths: indexPaths).count, 5)
    }
    
    // MARK: - canReloadItems
    
    func test_canReloadItems_shouldReturnTrue() {
        // Given
        let delegate = QCMockCollectionViewModelDelegate()
        delegate.mockCollectionView = QCMockCollectionView(frame: CGRect(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: UICollectionViewLayout())
        delegate.mockCollectionView?.mockNumberOfItems = 1
        delegate.mockCollectionView?.mockNumberOfSections = 2
        
        // When & Then
        XCTAssert(delegate.canReloadItems(indexPaths: [IndexPath(row: 0, section: 1)]))
    }
    
    func test_canReloadItems_shouldReturnFalse() {
        // Given
        let delegate = QCMockCollectionViewModelDelegate()
        delegate.mockCollectionView = QCMockCollectionView(frame: CGRect(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: UICollectionViewLayout())
        delegate.mockCollectionView?.mockNumberOfItems = 1
        delegate.mockCollectionView?.mockNumberOfSections = 2
        
        var indexPaths = [IndexPath]()
        
        for i in 0...30 {
            indexPaths.append(IndexPath(row: i, section: 1))
        }
        
        // When & Then
        XCTAssertFalse(delegate.canReloadItems(indexPaths: indexPaths))
    }
    
    func test_canReloadItems_shouldReturnFalse_forNumberOfIndexPathsGood_butWrongIndexPath() {
        // Given
        let delegate = QCMockCollectionViewModelDelegate()
        delegate.mockCollectionView = QCMockCollectionView(frame: CGRect(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: UICollectionViewLayout())
        delegate.mockCollectionView?.mockNumberOfItems = 1
        delegate.mockCollectionView?.mockNumberOfSections = 2
        var indexPaths = [IndexPath]()
        indexPaths.append(IndexPath(row: 16, section: 1))
        
        // When & Then
        XCTAssertFalse(delegate.canReloadItems(indexPaths: indexPaths))
    }
    
    // MARK: - shouldScrollToTop
    
    func test_shouldScrollToTop_shouldReturnTrue_whenNumberOfItemsInTheCollectionView_minusTheNumberOfIndexPaths_is_MinusOrEqualTo1() {
        
        // Given
        let delegate = QCMockCollectionViewModelDelegate()
        delegate.mockCollectionView = QCMockCollectionView(frame: CGRect(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: UICollectionViewLayout())
        delegate.mockCollectionView?.mockNumberOfItems = 1
        delegate.mockCollectionView?.mockNumberOfSections = 2
        
        // When & Then
        XCTAssert(delegate.shouldScrollToTop(indexPaths: [IndexPath(row: 0, section: 1)]))
    }
    
    func test_shouldScrollToTop_shouldReturnFalse_whenNumberOfItemsInTheCollectionView_minusTheNumberOfIndexPaths_isNot_MinusOrEqualTo1() {
        
        // Given
        let delegate = QCMockCollectionViewModelDelegate()
        delegate.mockCollectionView = QCMockCollectionView(frame: CGRect(x: 0, y: 0, width: 10, height: 10), collectionViewLayout: UICollectionViewLayout())
        delegate.mockCollectionView?.mockNumberOfItems = 5
        delegate.mockCollectionView?.mockNumberOfSections = 5
        
        // When & Then
        XCTAssertFalse(delegate.shouldScrollToTop(indexPaths: [IndexPath(row: 0, section: 1)]))
    }
    
}
