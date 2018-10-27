//
//  QCTableViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 20/6/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

open class QCTableViewModel: QCScrollViewViewModel {
    
    // MARK: - Properties
    
    public weak var tvDelegate: QCTableViewModelDelegate? {
        get {
            return self.delegate as? QCTableViewModelDelegate
        }
        set {}
    }
    
    public var tableFooterView: UIView?
    
    // MARK: - Register
    public func registerCells(tableView: UITableView) {
        guard let sections = self.sections as? [QCTableSection] else { return }
        
        for section in sections {
            guard let items = section.items as? [QCTableCellViewModel] else { return }
            
            for item in items {
                item.registerCell(tableView)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension QCTableViewModel: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.sections.count > section,
            let currentSection = self.sections[section] as? QCTableSection {
            return currentSection.items.count
        } else {
            return 0
        }
    }
        
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: "")
        
        if self.sections.count > 0 && self.sections.count > indexPath.section {
            
            if let currentSection = self.sections[indexPath.section] as? QCTableSection,
                let item = currentSection.items[indexPath.row] as? QCTableCellViewModel {
                item.indexPath = indexPath
                let reuseIdentifier = item.reuseIdentifier
                
                if reuseIdentifier == String(describing:UITableViewCell.self) {
                    cell = UITableViewCell(style: .value1,
                                           reuseIdentifier: reuseIdentifier)
                } else {
                    cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
                }
                
                item.configureCell(cell)
            }
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension QCTableViewModel: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.sections.count > section, let currentSection = self.sections[section] as? QCTableSection {
            return currentSection.heightForHeader
        } else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if self.sections.count > section, let currentSection = self.sections[section] as? QCTableSection {
            return currentSection.heightForFooter
        } else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if self.sections.count > 0 && self.sections.count > section {
            if let currentSection = self.sections[section] as? QCTableSection {
                if let titleForHeader = currentSection.titleForHeader,
                    let view = QCSectionHeaderFooterView.loadFromNib() as? QCSectionHeaderFooterView {
                    view.configure(title: titleForHeader)
                    return view
                } else {
                    return currentSection.viewForHeader
                }
            }
        }
        
        return nil
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if self.sections.count > 0 && self.sections.count > section {
            if let currentSection = self.sections[section] as? QCTableSection {
                if let titleForFooter = currentSection.titleForFooter,
                    let view = QCSectionHeaderFooterView.loadFromNib() as? QCSectionHeaderFooterView {                    
                    view.configure(title: titleForFooter)
                    return view
                } else {
                    return currentSection.viewForFooter
                }
            }
        }
        
        return nil
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.sections.count > 0 && self.sections.count > indexPath.section {
            
            if let currentSection = self.sections[indexPath.section] as? QCTableSection,
                let item = currentSection.items[indexPath.row] as? QCTableCellViewModel {
                
                return item.cellHeight(tableView.frame.size)
            }
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.sections.count > 0 && self.sections.count > indexPath.section {
            
            if let currentSection = self.sections[indexPath.section] as? QCTableSection,
                let item = currentSection.items[indexPath.row] as? QCTableCellViewModel {
                
                return item.estimatedHeight()
            }
        }
        return 0
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Override this method to do something special when a cell is Selected
        
        if self.sections.count > 0 && self.sections.count > indexPath.section {
            if let currentSection = self.sections[indexPath.section] as? QCTableSection,
                let item = currentSection.items[indexPath.row] as? QCTableCellViewModel,
                let vc = self.delegate as? UIViewController  {
                item.didSelect(fromVC: vc)
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            if self.sections.count > 0 && self.sections.count > indexPath.section && self.tableView(tableView, numberOfRowsInSection: indexPath.section) > 0 {
                
                if let currentSection = self.sections[indexPath.section] as? QCTableSection {
                
                    if currentSection.items.count > 0 && currentSection.items.count > indexPath.row,
                        let item = currentSection.items[indexPath.row] as? QCTableCellViewModel {
                        
                        item.willDisplay(cell)
                        self.visibleItems.append(item)
                    }
                }
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            if self.sections.count > 0 && self.sections.count > indexPath.section {
                
                if let currentSection = self.sections[indexPath.section] as? QCTableSection {
                    
                    if currentSection.items.count > 0 && currentSection.items.count > indexPath.row,
                        let item = currentSection.items[indexPath.row] as? QCTableCellViewModel {
                        
                        item.didEndDisplaying(cell)                                             
                        
                        if self.visibleItems.contains(item),
                            let index = self.visibleItems.index(of: item) {                            
                            self.visibleItems.remove(at: index)
                        }
                    }
                }
            }
        }
    }
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isDragging {
            DispatchQueue.main.async {
                self.tvDelegate?.scrollViewDidScroll?(scrollView)
            }
        }
    }
    
    open func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.tvDelegate?.scrollViewDidEndDecelerating?(scrollView)
    }
    
    open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.tvDelegate?.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
    }
    
}

extension UIView {
    class func loadFromNib() -> UIView? {
        var nibNamed = String(describing: self)
        let nibNamedArray = nibNamed.components(separatedBy: ".")
        if nibNamedArray.count > 0 {
            nibNamed = nibNamedArray.last ?? ""
        }
        
        return Bundle(for: self).loadNibNamed(nibNamed, owner: nil, options: nil)?.first as? UIView
    }
}
