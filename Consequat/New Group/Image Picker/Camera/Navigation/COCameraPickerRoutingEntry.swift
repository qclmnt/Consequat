//
//  COCameraPickerRoutingEntry.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation

class COCameraPickerRoutingEntry: QCRoutingEntry {
    
    // MARK: - QCRoutingEntry
    
    var navigationStyle: QCNavigationStyle {
        return .modal
    }
    
    var viewController: UIViewController? {
        let cameraPickerViewModel = COCameraPickerViewControllerViewModel()
        return COCameraPickerViewController(cameraPickerViewModel: cameraPickerViewModel)
    }

}
