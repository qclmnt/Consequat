//
//  COLibraryPickerCollectionViewControllerViewModel.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

import Photos

class COLibraryPickerCollectionViewControllerViewModel: QCCollectionViewModel {

    // MARK: - YMMViewModel
    
    override func load() {
        super.load() // This will call viewModelDidStartLoad
        self.loadAfterPermission(status: PHPhotoLibrary.authorizationStatus())
    }
    
    override func loadSections() {
        self.sections = [COLibraryPickerSection()]
    }
    
    // MARK: - Load from device
    
    func loadAfterPermission(status: PHAuthorizationStatus) {
        
        if (status == PHAuthorizationStatus.authorized) {
            
            // Access has been granted
            self.loadSections()
            self.delegate?.viewModelDidLoad()
            
        } else if (status == PHAuthorizationStatus.denied) {
            
            // Access has been denied
            self.delegate?.viewModelDidFail(statusCode: 0)
            
        } else if (status == PHAuthorizationStatus.notDetermined) {
            
            // Access has not been determined
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                
                // Request authorization is asynchronous
                DispatchQueue.main.async {
                    self.loadAfterPermission(status: newStatus)
                }
            })
            
        }
    }
    
}
