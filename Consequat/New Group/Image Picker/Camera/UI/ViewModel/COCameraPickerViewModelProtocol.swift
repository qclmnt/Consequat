//
//  COCameraPickerViewModelProtocol.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCCaptureSession
import QCViewModel

protocol COCameraPickerViewModelProtocol: QCViewControllerViewModel {
    
    // MARK: - Session management
    func startSession(capturePhotoView: UIView)
    func stopSession()
    
    // MARK: - Tools
    func takePicture()
    func updateFlash(flashView: UIView)
    func switchCamera()
    
    // MARK: - Options
    var optionsSection: QCCollectionViewSection? {get}
}
