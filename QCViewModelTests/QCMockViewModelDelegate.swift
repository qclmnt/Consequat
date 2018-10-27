//
//  QCMockViewModelDelegate.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 24/02/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit
@testable import QCViewModel

class QCMockViewModelDelegate: UIViewController, QCViewModelDelegate {
    
    var viewModel: QCViewModel?    

    var viewModelDidFailCalled = false
    func viewModelDidFail(statusCode: Int) {
        self.viewModelDidFailCalled = true
    }
    
    var viewModelDidStartLoadCalled = false
    func viewModelDidStartLoad() {
        self.viewModelDidStartLoadCalled = true
    }
    
    var viewModelDidLoadCalled = false
    func viewModelDidLoad() {
        self.viewModelDidLoadCalled = true
    }

}
