//
//  COImagePickerRoutingEntry.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation

enum PickerType {
    case library
    case camera
    
    func routingEntry() -> QCRoutingEntry {
        switch self {
        case .library:
            return COLibraryPickerRoutingEntry()
        case .camera:
            return COCameraPickerRoutingEntry()
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
        let routingEntries = [PickerType.library.routingEntry(),PickerType.camera.routingEntry()] as [QCRoutingEntry]
        let viewModel = COSegmentedPageViewControllerViewModel(itemsEntry: routingEntries,
                                                               initEntry: pickerType.routingEntry())
        
        return COSegmentedContainerViewController(viewModel: viewModel)
    }

}
