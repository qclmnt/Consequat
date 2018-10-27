//
//  QCMockCollectionViewModelDelegate.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 3/2/17.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import Foundation

@testable import QCViewModel

class QCMockCollectionViewModelDelegate: UIViewController, QCCollectionViewModelDelegate {
    
    var viewModel: QCViewModel?
        
    var mockCollectionView: QCMockCollectionView?
    var collectionView: UICollectionView? {
        get {
            return mockCollectionView
        }
    }
    
    var reloadDataViewCalled = false
    func reloadDataView() {
        reloadDataViewCalled = true
    }
    
    var reloadVisibleCellsCalled = false
    func reloadVisibleCells() {
        reloadVisibleCellsCalled = true
    }
    
    var QCReloadItemsCalled = false
    func QC_reloadItems(indexPaths: [IndexPath]) {
        QCReloadItemsCalled = true
    }
    
    
    var deleteItemsCalled = false
    func deleteItems(indexPaths: [IndexPath]) {
        deleteItemsCalled = true
    }
    
    var addItemsCalled = false
    func addItems(indexPaths: [IndexPath]) {
        addItemsCalled = true
    }
    
    var viewModelDidStartLoadCalled = false
    func viewModelDidStartLoad() {
        viewModelDidStartLoadCalled = true
    }
    
    var viewModelDidLoadCalled = false
    func viewModelDidLoad() {
        viewModelDidLoadCalled = true
    }
    
    var viewModelDidFailCalled = false
    var viewModelDidFailStatusCode = 0
    func viewModelDidFail(statusCode: Int) {
        viewModelDidFailStatusCode = statusCode
        viewModelDidFailCalled = true
    }
    
    var reloadSectionCalled = false
    func reloadSection(section: QCCollectionViewSection) {
        self.reloadSectionCalled = true
    }
    
    var scrollToTopCalled = false
    func scrollToTop() {
        self.scrollToTopCalled = true
    }
    
    var scrollViewDidScrollCalled = false
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.scrollViewDidScrollCalled = true
    }
}
