//
//  QCTableSection.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 22/06/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

open class QCTableSection: QCSection {
    
    // MARK: - Properties
    
    // Override in subclasses if needed
    // Height must be greater than 0 otherwise the header is always visible
    open var heightForHeader: CGFloat = 0.1
    
    open var titleForHeader: String?
    open var viewForHeader: UIView?
    
    // Override in subclasses if needed
    // Height must be greater than 0 otherwise the footer is always visible
    open var heightForFooter: CGFloat = 0.1
    
    open var titleForFooter: String?
    open var viewForFooter: UIView?
    open weak var delegate: QCTableViewModelDelegate?
    
    // MARK: - Actions
    open func footerTapped() {
        // Override in subclasses
    }
    
    open func headerTapped() {
        // Override in subclasses
    }

}
