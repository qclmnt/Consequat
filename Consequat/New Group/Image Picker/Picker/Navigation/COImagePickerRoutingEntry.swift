//
//  COImagePickerRoutingEntry.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation

enum PickerType: Int {
    case library
    case camera
    
    func viewController() -> UIViewController? {
        switch self {
        case .library:
            return COLibraryPickerRoutingEntry().viewController
        case .camera:
            return COCameraPickerRoutingEntry().viewController
        }
    }
}

struct COImagePickerRoutingEntry: QCRoutingEntry {
    
    // MARK: - Properties
    
    let pickerType: PickerType
    
    // MARK: - QCRoutingEntry
    
    var navigationStyle: QCNavigationStyle {
        return .modal
    }
    
    var viewController: UIViewController? {
        
        guard let libraryViewController = PickerType.library.viewController(),
            let cameraViewController = PickerType.camera.viewController() else {return nil}
        
        let viewControllers = [libraryViewController ,cameraViewController] as [UIViewController]
        let viewModel = COSegmentedPageViewControllerViewModel(itemsController: viewControllers,
                                                               initController: viewControllers[pickerType.rawValue])
        
        return COSegmentedContainerViewController(viewModel: viewModel)
    }

}
