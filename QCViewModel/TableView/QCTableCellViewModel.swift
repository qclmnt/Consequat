//
//  QCTableCellViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 20/6/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation
import QCNavigation

open class QCTableCellViewModel: QCCellViewModel {
     
    open override var reuseIdentifier: String {
        // Default value
        return NSStringFromClass(UITableViewCell.self)
    }
    
    open func configureCell(_ cell: UITableViewCell) {
        // Override this method in subclass
        cell.selectionStyle = .none
    }
    
    open func estimatedHeight() -> CGFloat {
        // Default Value
        return UITableView.automaticDimension
    }
    
    open func cellHeight(_ maxSize: CGSize) -> CGFloat {
        // Default Value
        return UITableView.automaticDimension
    }
    
    open func registerCell(_ tableView: UITableView) {
        tableView.register(self.cellNib,
                           forCellReuseIdentifier: self.reuseIdentifier)
    }
    
    open func willDisplay(_ cell: UITableViewCell) {
        // Override in sublcass
    }
    
    open func didEndDisplaying(_ cell: UITableViewCell) {
        // Override in sublcass
    }
    
}
