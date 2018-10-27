//
//  QCTableViewModelTests.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 14/10/16.
//  Copyright © 2016 Quentin CLEMENT. All rights reserved.
//

import XCTest
@testable import QCViewModel

class QCTableViewModelTests: XCTestCase {
    
    // MARK: - numberOfSectionsInTableView
    func test_numberOfSectionsInTableView_shouldBeEqualToNumberOfItems() {
        // Given
        let viewModel = self.viewModelToTestWithItems()
        let tableView = UITableView()        
        
        // When
        let numberOfSections = viewModel.numberOfSections(in: tableView)
        
        // Then
        XCTAssertEqual(numberOfSections, viewModel.sections.count)
    }
    
    // MARK: - numberOfRowsInSection
    
    func test_numberOfRowsInSection_shouldBeEqualToNumberOfSectionsInItems() {
        // Given
        let viewModel = self.viewModelToTestWithItems()
        let tableView = UITableView()
        
        for sectionIndex in 0..<viewModel.sections.count {
            // When
            let numberOfRows = viewModel.tableView(tableView, numberOfRowsInSection: sectionIndex)
            
            // Then
            XCTAssertEqual(numberOfRows, (viewModel.sections[sectionIndex] as! QCTableSection).items.count)
        }
    }
    
    func test_numberOfRowsInSection_shouldReturn0() {
        // Given
        let viewModel = self.viewModelEmptyToTest()
        let tableView = UITableView()
        
        for sectionIndex in 0..<5 {
            // When
            let numberOfRows = viewModel.tableView(tableView, numberOfRowsInSection: sectionIndex)
            
            // Then
            XCTAssertEqual(numberOfRows, 0)
        }
    }
    
    // MARK: - cellForRowAtIndexPath
    func test_cellForRowAtIndexPath_shouldReturnTableCellViewModel() {
        // Given
        let viewModel = self.viewModelToTestWithItems()
        let tableView = UITableView()
        
        for sectionIndex in 0..<viewModel.sections.count {
            let numberOfRows = viewModel.tableView(tableView, numberOfRowsInSection: sectionIndex)
            
            for row in 0..<numberOfRows {
                let indexPath = IndexPath(row: row, section: sectionIndex)
                // When
                let cell = viewModel.tableView(tableView, cellForRowAt: indexPath)
                let item = (viewModel.sections[sectionIndex]).items[row] as! QCTableCellViewModel
                
                // Then
                XCTAssertEqual(item.indexPath, indexPath)
                XCTAssertNotNil(cell)
            }
        }
    }
    
    // MARK: - heightForHeaderInSection
    
    func test_heightForHeaderInSection_shouldReturnSectionHeightForHeader() {
        // Given
        let viewModel = QCTableViewModel()
        let tableView = UITableView()
        let section = QCTableSection()
        let cellViewModel = QCTableCellViewModel()
        section.items = [cellViewModel]
        viewModel.sections = [section]
        
        // When
        let heightForHeaderInSection = viewModel.tableView(tableView,
                                                           heightForHeaderInSection: section.position)
        
        // Then
        XCTAssertEqual(heightForHeaderInSection, section.heightForHeader)
    }
    
    func test_heightForHeaderInSection_shouldReturn0() {
        // Given
        let viewModel = self.viewModelEmptyToTest()
        
        // When
        let heightForHeaderInSection = viewModel.tableView(UITableView(),
                                                           heightForHeaderInSection: 0)
        
        // Then
        XCTAssertEqual(heightForHeaderInSection, 0)
    }
    
    // MARK: - heightForFooterInSection
    
    func test_heightForFooterInSection_shouldReturnSectionHeightForFooter() {
        // Given
        let viewModel = QCTableViewModel()
        let tableView = UITableView()
        let section = QCTableSection()
        let cellViewModel = QCTableCellViewModel()
        section.items = [cellViewModel]
        viewModel.sections = [section]
        
        // When
        let heightForFooterInSection = viewModel.tableView(tableView,
                                                           heightForFooterInSection: section.position)
        
        // Then
        XCTAssertEqual(heightForFooterInSection, section.heightForFooter)
    }
    
    func test_heightForFooterInSection_shouldReturn0() {
        // Given
        let viewModel = self.viewModelEmptyToTest()
        let tableView = UITableView()
        
        // When
        let heightForFooterInSection = viewModel.tableView(tableView,
                                                           heightForFooterInSection: 0)
        
        // Then
        XCTAssertEqual(heightForFooterInSection, 0)
    }
    
    // MARK: - viewForHeaderInSection
    func test_viewForHeaderInSection_shouldReturnSectionHeaderFooterView_whenTitleForHeaderIsNotNil() {
        // Given
        let viewModel = QCTableViewModel()
        let tableView = UITableView()
        let section = QCTableSection()
        let cellViewModel = QCTableCellViewModel()
        section.items = [cellViewModel]
        section.titleForHeader = ""
        viewModel.sections = [section]
        
        // When
        let viewForHeaderInSection = viewModel.tableView(tableView,
                                                         viewForHeaderInSection: section.position)
        
        // Then
        XCTAssertEqual((viewForHeaderInSection as? QCSectionHeaderFooterView)?.titleLabel.text, section.titleForHeader)
        XCTAssert(viewForHeaderInSection is QCSectionHeaderFooterView)
    }
    
    func test_viewForHeaderInSection_shouldReturnSpecificSectionHeaderView_whenTitleForHeaderIsNil() {
        // Given
        let viewModel = QCTableViewModel()
        let tableView = UITableView()
        let section = QCTableSection()
        let cellViewModel = QCTableCellViewModel()
        section.items = [cellViewModel]
        section.viewForHeader = UIView()
        viewModel.sections = [section]
        
        // When
        let viewForHeaderInSection = viewModel.tableView(tableView,
                                                         viewForHeaderInSection: section.position)
        
        // Then
        XCTAssertEqual(viewForHeaderInSection, section.viewForHeader)
    }
    
    // MARK: - viewForFooterInSection
    func test_viewForFooterInSection_shouldReturnSectionHeaderFooterView_whenTitleForFooterIsNotNil() {
        // Given
        let viewModel = QCTableViewModel()
        let tableView = UITableView()
        let section = QCTableSection()
        let cellViewModel = QCTableCellViewModel()
        section.items = [cellViewModel]
        section.titleForFooter = ""
        viewModel.sections = [section]
        
        // When
        let viewForFooterInSection = viewModel.tableView(tableView,
                                                         viewForFooterInSection: section.position)
        
        // Then
        XCTAssertEqual((viewForFooterInSection as? QCSectionHeaderFooterView)?.titleLabel.text, section.titleForFooter)
        XCTAssert(viewForFooterInSection is QCSectionHeaderFooterView)
    }
    
    func test_viewForFooterInSection_shouldReturnSpecificSectionFooterView_whenTitleForFooterIsNil() {
        // Given
        let viewModel = QCTableViewModel()
        let tableView = UITableView()
        let section = QCTableSection()
        let cellViewModel = QCTableCellViewModel()
        section.items = [cellViewModel]
        section.viewForFooter = UIView()
        viewModel.sections = [section]
        
        // When
        let viewForFooterInSection = viewModel.tableView(tableView,
                                                         viewForFooterInSection: section.position)
        
        // Then
        XCTAssertEqual(viewForFooterInSection, section.viewForFooter)
    }
    
    // MARK: - heightForRowAtIndexPath
    
    func test_heightForRowAtIndexPath_shouldReturnAutomaticDimension() {
        // Given
        let viewModel = QCTableViewModel()
        let tableView = UITableView()
        let section = QCTableSection()
        let cellViewModel = QCTableCellViewModel()
        section.items = [cellViewModel]
        viewModel.sections = [section]
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let result = viewModel.tableView(tableView,
                                         heightForRowAt: indexPath)
        
        
        // Then
        XCTAssertEqual(result, UITableView.automaticDimension)
    }
    
    func test_heightForRowAtIndexPath_shouldReturn0() {
        // Given
        let viewModel = self.viewModelEmptyToTest()
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let result = viewModel.tableView(tableView,
                                         heightForRowAt: indexPath)
        
        
        // Then
        XCTAssertEqual(result, 0)
    }
    
    // MARK: - estimatedHeightForRowAtIndexPath
    func test_estimatedHeightForRowAtIndexPath_shouldReturnAutomaticDimension() {
        // Given
        let viewModel = QCTableViewModel()
        let tableView = UITableView()
        let section = QCTableSection()
        let cellViewModel = QCTableCellViewModel()
        section.items = [cellViewModel]
        viewModel.sections = [section]
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let result = viewModel.tableView(tableView,
                                         estimatedHeightForRowAt: indexPath)
        
        // Then
        XCTAssertEqual(result, UITableView.automaticDimension)
    }
    
    // MARK: - didSelectRowAtIndexPath
    func test_didSelectRowAtIndexPath_shouldCallDidSelectOnItem() {
        // Given
        let viewModel = QCTableViewModel()
        let mockDelegate = QCMockTableViewModelDelegate()
        viewModel.delegate = mockDelegate
        let cellViewModel = QCMockTableCellViewModel()
        let firstSection = QCTableSection()
        firstSection.items = [cellViewModel, cellViewModel]
        viewModel.sections = [firstSection]
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        viewModel.tableView(tableView,
                            didSelectRowAt: indexPath)
        
        // Then
        XCTAssert(cellViewModel.didSelectCalled)
    }
    
    // MARK: - didEndDisplayingCell
    func test_didEndDisplayingCell_shouldNotCrash_whenTryingToAccessSectionInEmptyArray() {
        // Given
        let viewModel = QCTableViewModel()
        let tableView = UITableView()
        let cell = UITableViewCell()
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When & Then
        viewModel.tableView(tableView,
                            didEndDisplaying: cell,
                            forRowAt: indexPath)
    }
    
    // MARK: scrollViewDidScroll
    func test_scrollViewDidScroll_shouldCalledDelegate() {
        // Given
        let viewModel = QCTableViewModel()
        let delegate = QCMockTableViewModelDelegate()
        viewModel.delegate = delegate
        let tableView = QCMockTableView()
        tableView.mockIsDragging = true
        
        weak var localExpectation = self.expectation(description: "test_scrollViewDidScroll_shouldCalledDelegate")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Then
            XCTAssert(delegate.scrollViewDidScrollCalled)
            localExpectation?.fulfill()
            localExpectation = nil
        }
        
        // When
        viewModel.scrollViewDidScroll(tableView)
        
        wait(for: [localExpectation!], timeout: 2, enforceOrder: true)        
    }

    // MARK: scrollViewDidEndDecelerating
    func test_scrollViewDidEndDecelerating_shouldCalledDelegate() {
        // Given
        let viewModel = QCTableViewModel()
        let delegate = QCMockTableViewModelDelegate()
        viewModel.delegate = delegate
        let tableView = UITableView()
        
        // When
        viewModel.scrollViewDidEndDecelerating(tableView)
        
        // Then
        XCTAssert(delegate.scrollViewDidEndDeceleratingCalled)
    }
    
    // MARK: scrollViewDidEndDragging
    func test_scrollViewDidEndDragging_shouldCalledDelegate() {
        // Given
        let viewModel = QCTableViewModel()
        let delegate = QCMockTableViewModelDelegate()
        viewModel.delegate = delegate
        let tableView = UITableView()
        
        // When
        viewModel.scrollViewDidEndDragging(tableView,
                                           willDecelerate: true)
        
        // Then
        XCTAssert(delegate.scrollViewDidEndDraggingCalled)
    }
    
    // MARK: - registerCellsOnTableView
    func test_registerCellsOnTableView_shouldCallRegisterCellOnItem() {
        // Given
        let viewModel = QCTableViewModel()
        let cellViewModel = QCMockTableCellViewModel()
        let firstSection = QCTableSection()
        firstSection.items = [cellViewModel, cellViewModel]
        viewModel.sections = [firstSection]
        let tableView = UITableView()
        
        // When
        viewModel.registerCells(tableView: tableView)
        
        // Then
        XCTAssert(cellViewModel.registerCellCalled)
    }
    
    // MARK: - Helper Method
    func viewModelToTestWithItems() -> QCTableViewModel {
        let viewModel = QCTableViewModel()
        let item = QCTableCellViewModel()
        let firstSection = QCTableSection()
        firstSection.items = [item, item]
        let secondSection = QCTableSection()
        secondSection.items = [item]
        viewModel.sections = [firstSection, secondSection]
        return viewModel
    }
    
    func viewModelEmptyToTest() -> QCTableViewModel {
        let viewModel = QCTableViewModel()
        let item = QCTableCellViewModel()
        let firstSection = QCTableSection()
        firstSection.items = []
        let secondSection = QCTableSection()
        secondSection.items = [item]
        viewModel.sections = []
        return viewModel
    }
    
}
