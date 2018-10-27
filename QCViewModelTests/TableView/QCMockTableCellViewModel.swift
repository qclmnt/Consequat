//
//  QCMockTableCellViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 17/10/16.
//  Copyright © 2016 Quentin CLEMENT. All rights reserved.
//

import UIKit
@testable import QCViewModel

class QCMockTableCellViewModel: QCTableCellViewModel {

    var didSelectCalled = false
    override func didSelect(fromVC fromViewController: UIViewController!) {
        self.didSelectCalled = true
    }
    
    
    var registerCellCalled = false
        
    override func registerCell(_ tableView: UITableView) {
        self.registerCellCalled = true
    }
    
    override func estimatedHeight() -> CGFloat {
        return 50;
    }
    
    override func cellHeight(_ maxSize: CGSize) -> CGFloat {
        return 50;
    }
}
