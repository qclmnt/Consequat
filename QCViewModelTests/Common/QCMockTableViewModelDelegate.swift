//
//  QCMockTableViewModelDelegate.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 28/12/2016.
//  Copyright © 2016 Quentin CLEMENT. All rights reserved.
//

import Foundation
@testable import QCViewModel

class QCMockTableViewModelDelegate: UIViewController, QCTableViewModelDelegate {
    
    var viewModel: QCViewModel?
    
    var viewModelDidStartLoadCalled = false
    func viewModelDidStartLoad() {
        viewModelDidStartLoadCalled = true
    }
    
    var viewModelDidLoadCalled = false
    func viewModelDidLoad() {
        viewModelDidLoadCalled = true
    }
    
    var viewModelDidFailCalled = false
    func viewModelDidFail(statusCode: Int) {
        viewModelDidFailCalled = true
    }
    
    var refreshHeightCellsInTableViewCalled = false
    func refreshHeightCellsInTableView() {
        refreshHeightCellsInTableViewCalled = true
    }
    
    var reloadVisibleCellsCalled = false
    func reloadVisibleCells() {
        self.reloadVisibleCellsCalled = true
    }
    
    var reloadSectionCalled = false
    func reload(section: QCTableSection) {
        reloadSectionCalled = true
    }
    
    var reloadRowsCalled = false
    func reloadRows(indexPaths: [IndexPath]) {
        reloadRowsCalled = true
    }
    
    var deleteRowsCalled = false
    func deleteRows(indexPaths: [IndexPath]) {
        deleteRowsCalled = true
    }
    
    var reloadDataViewCalled = false
    func reloadDataView() {
        reloadDataViewCalled = true
    }
    
    var scrollViewDidScrollCalled = false
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.scrollViewDidScrollCalled = true
    }
    
    var scrollViewDidEndDeceleratingCalled = false
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndDeceleratingCalled = true
    }
    
    var scrollViewDidEndDraggingCalled = false
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.scrollViewDidEndDraggingCalled = true
    }
    
    var scrollToTopCalled = false
    func scrollToTop() {
        scrollToTopCalled = true
    }
}
