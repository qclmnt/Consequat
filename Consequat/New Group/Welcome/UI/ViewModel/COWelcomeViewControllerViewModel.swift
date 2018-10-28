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
    
    lazy var libraryRoutingEntry = COLibraryPickerRoutingEntry()
    lazy var cameraRoutingEntry = COCameraPickerRoutingEntry()
    
    // MARK: - Actions
    
    mutating func routeToLibrary() {
        COAppEnvironment.shared().routing?.route(to: self.libraryRoutingEntry)
    }
    
    mutating func routeToCamera() {
        COAppEnvironment.shared().routing?.route(to: self.cameraRoutingEntry)
    }

}
