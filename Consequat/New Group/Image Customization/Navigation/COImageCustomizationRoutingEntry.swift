//
//  COImageCustomizationRoutingEntry.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation

struct COImageCustomizationRoutingEntry: QCRoutingEntry {
    
    // MARK: - Properties
    
    let image: UIImage
    
    // MARK: - Initialization
    
    init(image: UIImage) {
        self.image = image
    }
    
    // MARK: - QCRoutingEntry

    var viewController: UIViewController? {
        let imageCustomizationVM = COImageCustomizationViewControllerViewModel(image: self.image)
        let imageCustomizationViewController = COImageCustomizationViewController(viewModel: imageCustomizationVM)
        return imageCustomizationViewController
    }
}
