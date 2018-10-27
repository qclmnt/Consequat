//
//  QCFatTitleCellViewModelTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 16/02/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCFatTitleCellViewModelTests: XCTestCase {
    
    // MARK: init
    func test_init_shouldSetRecipeTitle() {
        
        // Given
        let recipeTitle = "Champagne"
        
        // When
        let cellModel = QCFatTitleCellViewModel(title: recipeTitle)
        
        // Then
        XCTAssertEqual(cellModel.title, recipeTitle)
    }
    
    // MARK: - reuseIdentifier
    func test_reuseIdentifier_shouldReturnRecipeTitleCell() {
        
        // Given
        let cellModel = QCFatTitleCellViewModel(title: "Champagne")
        
        // When & Then
        XCTAssertEqual(cellModel.reuseIdentifier, String(describing: QCFatTitleCollectionViewCell.self))
    }
    
    // MARK: - configureCell
    func test_configureCell_souldSetTitle() {
        
        // Given
        
        let cell = Bundle(for: QCFatTitleCollectionViewCell.self).loadNibNamed(String(describing: QCFatTitleCollectionViewCell.self), owner: self, options: nil)?.first as! QCFatTitleCollectionViewCell
        let recipeTitle = "Champagne"
        let cellModel = QCFatTitleCellViewModel(title: recipeTitle)
        
        // When
        cellModel.configureCell(cell, collectionView: nil)
        
        // Then
        XCTAssertEqual(cell.titleLabel.text, recipeTitle)
    }
}
