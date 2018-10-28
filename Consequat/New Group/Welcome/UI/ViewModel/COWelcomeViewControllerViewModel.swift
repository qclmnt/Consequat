//
//  COWelcomeViewControllerViewModel.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 27/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

struct COWelcomeViewControllerViewModel: QCViewControllerViewModel {
    
    // MARK: - Properties
    
    let welcomeImageName = "welcome"
    let libraryImageName = "library"
    let cameraImageName = "camera"
    
    let libraryRoutingEntry = COLibraryPickerRoutingEntry()
    
    // MARK: - Actions
    
    func routeToLibrary() {
        COAppEnvironment.shared().routing?.route(to: self.libraryRoutingEntry)
    }
    
    func routeToCamera() {
        // Todo: Route to camera routing entry
    }

}
