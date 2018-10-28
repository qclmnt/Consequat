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
    
    func startSession(capturePhotoView: UIView)
    func stopSession()
    
    func takePicture()
    func updateFlash(flashView: UIView)
    func switchCamera()
    
}
