//
//  QCCollectionViewModelTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 3/2/17.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCCollectionViewModelTests: XCTestCase {
    
    // MARK: - collectionViewModelDelegate
    
    func test_collectionViewModelDelegate_shouldNotBeNil_whenDelegateIsNotNil() {
        
        // Given
        let collectionViewModel = QCCollectionViewModel()
        let delegate = QCMockCollectionViewModelDelegate()
        collectionViewModel.delegate = delegate
        
        // When & Then
        XCTAssertNotNil(collectionViewModel.collectionViewModelDelegate)
    }
    
    func test_collectionViewModelDelegate_shouldBeNil_whenDelegateIsNil() {
        
        // Given
        let collectionViewModel = QCCollectionViewModel()
        collectionViewModel.delegate = nil
        
        // When & Then
        XCTAssertNil(collectionViewModel.collectionViewModelDelegate)
    }
    
    // MARK: - numberOfSections
    func test_numberOfSections_shouldReturnSectionCount() {
        // Given
        let viewModel = QCCollectionViewModel()
        viewModel.sections = [QCCollectionViewSection()]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        // When
        let nbSections = viewModel.numberOfSections(in: collectionView)
        
        // Then
        XCTAssertEqual(nbSections, viewModel.sections.count)
    }
    
    // MARK: - numberOfItemsInSection
    func test_numberOfItemsInSection_shouldReturnNumberOfItemsInASpecificSection() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        section.items = [QCCollectionCellViewModel()]
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        // When
        let nbItems = viewModel.collectionView(collectionView, numberOfItemsInSection: 0)
        
        // Then
        XCTAssertEqual(nbItems, section.items.count)
    }
    
    func test_numberOfItemsInSection_shouldReturn0_whenIsNotACorrectSection() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCSection()
        section.items = [QCCollectionCellViewModel()]
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        // When
        let nbItems = viewModel.collectionView(collectionView, numberOfItemsInSection: 0)
        
        // Then
        XCTAssertEqual(nbItems, 0)
    }
    
    // MARK: - cellForItemAt
    
    func test_cellForItemAt_shouldReturnASpecificCell_andConfigureItem() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        let item = QCMockCollectionCellViewModel()
        section.items = [item]
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        viewModel.registerCellsAndReusableViews(on: collectionView)
        collectionView.dataSource = viewModel
        
        
        // When
        let cell = viewModel.collectionView(collectionView,
                                            cellForItemAt: indexPath)
        
        // Then
        XCTAssert(item.configureCellCalled)
        XCTAssertEqual(item.indexPath, indexPath)
        XCTAssert(cell is QCMockCollectionCell)
    }
    
    func test_cellForItemAt_shouldReturnADefaultCell() {
        // Given
        let viewModel = QCCollectionViewModel()
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        viewModel.registerCellsAndReusableViews(on: collectionView)
        
        // When
        let cell = viewModel.collectionView(collectionView,
                                            cellForItemAt: indexPath)
        
        // Then
        XCTAssertNotNil(cell)
    }
    
    // MARK: - willDisplayCell
    func test_willDisplayCell_shouldCalledWillDisplayCellOnItem() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        let item = QCMockCollectionCellViewModel()
        section.items = [item]
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = UICollectionViewCell()
        
        // When
        viewModel.collectionView(collectionView,
                                 willDisplay: cell,
                                 forItemAt: indexPath)
        
        // Then
        XCTAssert(item.willDisplayCellCalled)
    }
    
    // MARK: - viewForSupplementaryElementOfKind
    func test_viewForSupplementaryElementOfKind_shouldReturnADefaultReusableView() {
        // Given
        let viewModel = QCCollectionViewModel()
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        
        
        // When
        let reusableView = viewModel.collectionView(collectionView,
                                                    viewForSupplementaryElementOfKind: "",
                                                    at: indexPath)
        
        // Then
        XCTAssertNotNil(reusableView)
    }
    
    // MARK: - didSelectItemAt
    func test_didSelectItemAt_shouldCalledDidSelectOnItem() {
        // Given
        let viewModel = QCCollectionViewModel()
        let delegate = QCMockCollectionViewModelDelegate()
        viewModel.delegate = delegate
        let section = QCCollectionViewSection()
        let item = QCMockCollectionCellViewModel()
        section.items = [item]
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        viewModel.collectionView(collectionView,
                                 didSelectItemAt: indexPath)
        
        // Then
        XCTAssert(item.didSelectCalled)
    }
    
    // MARK: - minimumLineSpacingForSectionAt
    func test_minimumLineSpacingForSectionAt_shouldReturnSectionMinimumLineSpacing() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let minimumLineSpacing = viewModel.collectionView(collectionView,
                                                          layout: layout,
                                                          minimumLineSpacingForSectionAt: indexPath.section)
        
        // Then
        XCTAssertEqual(minimumLineSpacing, section.minimumLineSpacing)
    }
    
    // MARK: - minimumInteritemSpacingForSectionAt
    func test_minimumInteritemSpacingForSectionAt_shouldReturnSectionMinimumInterItemSpacing() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let minimumInteritemSpacing = viewModel.collectionView(collectionView,
                                                               layout: layout,
                                                               minimumInteritemSpacingForSectionAt: indexPath.section)
        
        // Then
        XCTAssertEqual(minimumInteritemSpacing, section.minimumInteritemSpacing)
    }
    
    // MARK: - insetForSectionAt
    func test_insetForSectionAt_shouldReturnSectionEdgeInsets() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let insets = viewModel.collectionView(collectionView,
                                              layout: layout,
                                              insetForSectionAt: indexPath.section)
        
        // Then
        XCTAssertEqual(insets, section.edgeInsets)
    }
    
    // MARK: - sizeForItemAt
    func test_sizeForItemAt_shouldNotReturnCGSizeZero() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        let item = QCMockCollectionCellViewModel()
        section.items = [item]
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let size = viewModel.collectionView(collectionView,
                                            layout: layout,
                                            sizeForItemAt: indexPath)
        
        // Then
        XCTAssert(item.cellSizeCalled)
        XCTAssertFalse(size.equalTo(CGSize.zero))
    }
    
    func test_sizeForItemAt_shouldReturnCGSizeZero() {
        // Given
        let viewModel = QCCollectionViewModel()
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let size = viewModel.collectionView(collectionView,
                                            layout: layout,
                                            sizeForItemAt: indexPath)
        
        // Then
        XCTAssert(size.equalTo(CGSize.zero))
    }
    
    // MARK: - referenceSizeForHeaderInSection
    func test_referenceSizeForHeaderInSection_shouldNotReturnCGSizeZero() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        let headerViewModel = QCMockCollectionViewReusableViewModel(text: "", style: QCBasicBoldCollectionReusableViewStyle())
        section.header = headerViewModel
        let item = QCMockCollectionCellViewModel()
        section.items = [item]
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        let expectedSize = CGSize(width: collectionView.frame.size.width, height: 50)
        
        // When
        let size = viewModel.collectionView(collectionView,
                                            layout: layout,
                                            referenceSizeForHeaderInSection: indexPath.section)
        
        // Then
        XCTAssertFalse(size.equalTo(CGSize.zero))
        XCTAssert(size.equalTo(expectedSize))
    }
    
    func test_referenceSizeForHeaderInSection_shouldReturnCGSizeZero() {
        // Given
        let viewModel = QCCollectionViewModel()
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let size = viewModel.collectionView(collectionView,
                                            layout: layout,
                                            referenceSizeForHeaderInSection: indexPath.section)
        
        // Then
        XCTAssert(size.equalTo(CGSize.zero))
    }
    
    // MARK: - registerCellsAndReusableViews
    func test_registerCellsAndReusableViews_shouldCalledRegisterCellOnItem() {
        // Given
        let viewModel = QCCollectionViewModel()        
        let section = QCCollectionViewSection()
        let item = QCMockCollectionCellViewModel()
        section.items = [item]
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        // When
        viewModel.registerCellsAndReusableViews(on: collectionView)
        
        // Then
        XCTAssert(item.registerCellCalled)
    }
    
    func test_registerCellsAndReusableViews_shouldCalledRegister_whenHaveHeader() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        let headerViewModel = QCMockCollectionViewReusableViewModel(text: "",style: QCBasicBoldCollectionReusableViewStyle())
        section.header = headerViewModel
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        // When
        viewModel.registerCellsAndReusableViews(on: collectionView)
        
        // Then
        XCTAssert(headerViewModel.registerCalled)
    }
    
    // MARK: - registerCellsAndReusableViews
    func test_registerCellsAndReusableViews_shouldCalledRegister_whenHaveFooter() {
        // Given
        let viewModel = QCCollectionViewModel()
        let section = QCCollectionViewSection()
        let footerViewModel = QCMockCollectionViewReusableViewModel(text: "",style: QCBasicBoldCollectionReusableViewStyle())
        section.footer = footerViewModel
        viewModel.sections = [section]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        // When
        viewModel.registerCellsAndReusableViews(on: collectionView)
        
        // Then
        XCTAssert(footerViewModel.registerCalled)
    }
    
    // MARK: - scrollViewDidScroll
    func test_scrollViewDidScroll_shouldCalledRegisterOnHeader() {
        // Given
        let viewModel = QCCollectionViewModel()
        let delegate = QCMockCollectionViewModelDelegate()
        viewModel.delegate = delegate
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        // When
        viewModel.scrollViewDidScroll(collectionView)
        
        // Then
        XCTAssert(delegate.scrollViewDidScrollCalled)
    }

}
