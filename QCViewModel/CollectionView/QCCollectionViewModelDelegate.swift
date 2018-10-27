//
//  QCCollectionViewModelDelegate.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 25/01/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit

public protocol QCCollectionViewModelDelegate: QCViewModelDelegate {
    func reloadSection(section:QCCollectionViewSection)
    func deleteItems(indexPaths: [IndexPath])
    func addItems(indexPaths: [IndexPath])
    func scrollToTop()
    func reloadDataView()
    func reloadVisibleCells()
    func QC_reloadItems(indexPaths: [IndexPath])
    
    var collectionView: UICollectionView? { get }
}

public extension QCCollectionViewModelDelegate {
    
    func QC_reloadItems(indexPaths: [IndexPath]) {
        if indexPaths.count > 0,
            self.canReloadItems(indexPaths: indexPaths) {
            self.collectionView?.reloadItems(at: indexPaths)
        }        
    }
    
    func reloadVisibleCells() {
        if let indexPaths = self.collectionView?.indexPathsForVisibleItems,
            indexPaths.count > 0 {
            self.collectionView?.reloadItems(at: indexPaths)
        }
    }
    
    func reloadSection(section: QCCollectionViewSection) {
        let sectionsIndexSet = IndexSet(integer: section.position)        
        UIView.performWithoutAnimation {
            self.collectionView?.reloadSections(sectionsIndexSet)
        }
    }
    
    func deleteItems(indexPaths: [IndexPath]) {
        if indexPaths.count > 0 {
            if (self.shouldScrollToTop(indexPaths: indexPaths)) {
                self.collectionView?.scrollToTop()
            }
            self.collectionView?.deleteItems(at: indexPaths)
        }
    }
    
    func addItems(indexPaths: [IndexPath]) {
        if indexPaths.count > 0 {
            self.collectionView?.insertItems(at: indexPaths)
        }
    }
    
    func scrollToTop() {
        self.collectionView?.scrollToTop()
    }
    
    func reloadDataView() {
        UIView.performWithoutAnimation {
            self.collectionView?.reloadData()
        }
    }
    
    // MARK: - Helper
    
    func numberOfRowTotal(collectionView: UICollectionView) -> Int {
        let numberOfSectionTotal = collectionView.numberOfSections
        var numberOfRowTotal = 0
        for sectionIndex in 0..<numberOfSectionTotal {
            numberOfRowTotal += collectionView.numberOfItems(inSection: sectionIndex)
        }
        return numberOfRowTotal
    }
    
    func indexPaths(section: Int, indexPaths: [IndexPath]) -> [IndexPath] {
        var indexPathsToReturn = [IndexPath]()
        for indexPath in indexPaths {
            if (indexPath.section == section) {
                indexPathsToReturn.append(indexPath)
            }
        }
        return indexPathsToReturn
    }
    
    func canReloadItems(indexPaths: [IndexPath]) -> Bool {
        guard let collectionView = self.collectionView else { return false }
        for sectionIndex in 0..<collectionView.numberOfSections {
            let indexPathsForCurrentSection = self.indexPaths(section: sectionIndex, indexPaths: indexPaths)
            for indexPath in indexPathsForCurrentSection {
                if indexPath.row < collectionView.numberOfItems(inSection: sectionIndex) {
                    continue
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    func shouldScrollToTop(indexPaths: [IndexPath]) -> Bool {
        guard let collectionView = self.collectionView else { return false }
        return self.numberOfRowTotal(collectionView: collectionView) - indexPaths.count <= 1
    }
}

extension UIScrollView {
    
    func scrollToTop() {
        self.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: true)
    }
}
