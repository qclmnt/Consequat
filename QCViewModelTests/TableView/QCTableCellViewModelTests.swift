//
//  QCTableCellViewModelTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 4/10/16.
//  Copyright © 2016 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel
@testable import QCNavigation

class QCTableCellViewModelTests: XCTestCase {
    
    //MARK: - reuseIdentifier
    func test_reuseIdentifier_shouldReturnCorrectIdentifier() {
        // Given
        let item = QCTableCellViewModel()
        
        // When
        let identifier = item.reuseIdentifier
        
        // Then
        XCTAssertEqual(identifier, NSStringFromClass(UITableViewCell.self))
    }

    // MARK: - cellNib
    func test_cellNib_shouldNotReturnNil() {
        // Given
        let item = QCTableCellViewModel()
        
        // When
        let nib = item.cellNib
        
        // Then
        XCTAssertNotNil(nib)
    }
    
    // MARK: - configureCell
    func test_configureCell_shouldSetSelectionStyleToNone() {
        // Given
        let cell = UITableViewCell()
        let item = QCTableCellViewModel()
        
        // When
        item.configureCell(cell)
        
        // Then
        XCTAssert(cell.selectionStyle == .none)
    }
    
    // MARK: - estimatedHeight
    func test_estimatedHeight_shouldReturnUITableViewAutomaticDimension() {
        // Given
        let item = QCTableCellViewModel()
        
        // When
        let height = item.estimatedHeight()
        
        // Then
        XCTAssertEqual(height, UITableView.automaticDimension)
    }
    
    // MARK: - cellHeight
    func test_cellHeight_shouldReturnUITableViewAutomaticDimension() {
        // Given
        let item = QCTableCellViewModel()
        let maxSize = CGSize(width: 300, height: 300)
        
        // When
        let height = item.cellHeight(maxSize)
        
        // Then
        XCTAssertEqual(height, UITableView.automaticDimension)
    }
    
}
