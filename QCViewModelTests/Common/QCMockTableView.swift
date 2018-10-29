//
//  QCMockTableView.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 2/1/17.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit

class QCMockTableView: UITableView {

    var mockVisibleCells = [UITableViewCell]()
    override var visibleCells: [UITableViewCell] {
        return mockVisibleCells
    }
    
    var mockIsDragging = false
    override var isDragging: Bool {
        get {
            return mockIsDragging
        }
    }
    
}
