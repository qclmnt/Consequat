//
//  QCCellViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 20/6/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation
import QCNavigation

open class QCCellViewModel: NSObject {
    
    // MARK: - Properties
    open var routingEntry: QCRoutingEntry?
    open var indexPath: IndexPath?
    
    open var reuseIdentifier: String {
        return ""
    }
    
    open var bundleForNib: Bundle {
        return Bundle(for: type(of: self))
    }
    
    open var cellNib: UINib? {
        if self.reuseIdentifier.count > 0 {
            return UINib(nibName: self.reuseIdentifier,
                         bundle: self.bundleForNib)
        }
        
        return nil
    }
    
    // MARK: - Methods
    open func didSelect(fromVC: UIViewController?) {
        // Nothing by default
    }
}
