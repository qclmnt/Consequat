//
//  QCSection.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 22/06/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

@objcMembers
open class QCSection: NSObject {
    
    // MARK: - Properties
    open var position = 0
    open var items = [QCCellViewModel]()    
    
    // MARK: - Init
    public override init() {
        // Do not delete
    }
    
    // MARK: - Reload Section
    open func reloadItemsInSection() {
        self.items = [QCCellViewModel]()
    }
}


