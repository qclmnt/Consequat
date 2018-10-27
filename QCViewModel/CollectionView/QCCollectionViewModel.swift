//
//  QCCollectionViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 23/01/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit
import QCDeviceHelper

open class QCCollectionViewModel: QCScrollViewViewModel, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public lazy var flowLayout = QCCollectionViewFlowLayout()
    
    public weak var collectionViewModelDelegate: QCCollectionViewModelDelegate? {
        get {
            return self.delegate as? QCCollectionViewModelDelegate
        }
        set {}
    }
    
    // MARK: - UICollectionViewDataSource
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection {
            return currentSection.items.count
        }
        
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection {
            if let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel {
                item.indexPath = indexPath
                let reuseIdentifier = item.reuseIdentifier
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
                item.configureCell(cell, collectionView: collectionView)
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    open func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection,
            currentSection.items.count > indexPath.row,
            let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel else {
                return
        }
        item.willDisplayCell(cell)
        self.visibleItems.append(item)
    }
    
    open func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection,
            currentSection.items.count > indexPath.row,
            let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel else {
                return
        }
        item.didEndDisplaying(cell)
        if self.visibleItems.contains(item),
            let index = self.visibleItems.index(of: item) {
            self.visibleItems.remove(at: index)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection else {
                return UICollectionReusableView()
        }
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerModel = currentSection.header else { return UICollectionReusableView() }
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: headerModel.supplementaryElementKind,
                                                                             withReuseIdentifier: headerModel.reuseIdentifier, for: indexPath)
            headerModel.configureView(view: headerView)
            return headerView
        } else {
            guard let footerModel = currentSection.footer else { return UICollectionReusableView() }
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: footerModel.supplementaryElementKind,
                                                                             withReuseIdentifier: footerModel.reuseIdentifier, for: indexPath)
            footerModel.configureView(view: footerView)
            return footerView
        }
        
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection,
            let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel else {
                return
        }
        
        item.didSelect(fromVC: self.delegate as? UIViewController)
    }
    
    // MARK: - UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection else {
                return
        }
        
        if elementKind == QCDecorationCollectionReusableViewModel.decorationViewOfKind {
            guard let headerView = view as? QCDecorationCollectionReusableView else { return }
            let headerModel = currentSection.decoration
            headerView.configure(viewModel: headerModel)
        }
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return 0
        }
        return currentSection.minimumLineSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return 0
        }
        
        return currentSection.minimumInteritemSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return UIEdgeInsets.zero
        }
        return currentSection.edgeInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var itemSize = CGSize.zero
        
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection,
            let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel else {
                return itemSize
        }
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            
            if flowLayout.scrollDirection == .vertical {
                let collectionWidth = collectionView.bounds.size.width
                let widthMinusEdgeInsets = collectionWidth - currentSection.edgeInsets.left - currentSection.edgeInsets.right
                let widthMinusInterItemSpacing = widthMinusEdgeInsets - (currentSection.minimumInteritemSpacing * CGFloat(currentSection.numberOfColumns-1))
                let maxWidth = widthMinusInterItemSpacing/CGFloat(currentSection.numberOfColumns) - 1
                itemSize = item.cellSize(maxSize: CGSize(width: maxWidth, height: collectionView.bounds.size.height))
                
                if QCDeviceHelper.isIpad() {
                    let decoration = currentSection.decoration
                    if decoration.decorationViewInfos == nil {
                        decoration.decorationViewInfos = QCDecorationViewInfos(collectionViewWidth: collectionWidth,
                                                                                numberOfColumns: currentSection.numberOfColumns,
                                                                                sectionEdgeInsets: currentSection.edgeInsets)
                        let indexPathKey = NSIndexPath(row: 0, section: indexPath.section)
                        self.flowLayout.decorationsInfos[indexPathKey] = decoration.decorationViewInfos
                    }
                    decoration.decorationViewInfos?.addSectionItemHeight(item: indexPath.item, height: itemSize.height)
                }
            }
            else {
                let collectionHeight = collectionView.bounds.size.height
                let heightMinusEdgeInsets = collectionHeight - currentSection.edgeInsets.top - currentSection.edgeInsets.bottom
                let heightMinusInterItemSpacing = heightMinusEdgeInsets - (currentSection.minimumInteritemSpacing * CGFloat(currentSection.numberOfColumns-1))
                let maxHeight = heightMinusInterItemSpacing/CGFloat(currentSection.numberOfColumns) - 1
                itemSize = item.cellSize(maxSize: CGSize(width: collectionView.bounds.size.width, height: maxHeight))
            }
            
        }
        
        return itemSize
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return CGSize.zero
        }
        
        guard let headerModel = currentSection.header else { return CGSize.zero }
        return headerModel.viewSize(maxSize: collectionView.bounds.size)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return CGSize.zero
        }
        
        guard let footerModel = currentSection.footer else { return CGSize.zero }
        return footerModel.viewSize(maxSize: collectionView.bounds.size)
    }
    
    // MARK: - Register Cell
    
    open func registerCellsAndReusableViews(on collectionView: UICollectionView) {
        guard let sections = self.sections as NSArray as? [QCCollectionViewSection] else {
            return
        }
        
        for section in sections {
            // Header
            if let header = section.header {
                header.register(on: collectionView)
            }
            
            // Cells
            if let items = section.items as NSArray as? [QCCollectionCellViewModel]  {
                for item in items {
                    item.registerCell(collectionView)
                }
            }
            
            // Footer
            if let footer = section.footer {
                footer.register(on: collectionView)
            }
            
            // Decoration view
            section.decoration.register(on: collectionView)
        }
    }
    
    // MARK: - UIScrollViewDelegate
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.delegate?.scrollViewDidScroll?(scrollView)
    }
    
}
