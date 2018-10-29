//
//  COCameraPickerViewControllerViewModel.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import AVFoundation

import QCCaptureSession
import QCViewModel

class COCameraPickerViewControllerViewModel: COCameraPickerViewModelProtocol {
    
    let captureSession = QCCaptureSession()
    
    var optionsSection: QCCollectionViewSection? {
        return nil
    }
    
    // MARK: - Session
    
    func startSession(capturePhotoView: UIView) {
        self.captureSession.startSession(capturePhotoView: capturePhotoView)
    }
    
    func stopSession() {
        self.captureSession.stopSession()
    }
    
    // MARK : - Flash
    
    func deviceHasFlash() -> Bool {
        guard let device = self.captureSession.device else {
            return false
        }
        return device.hasFlash
    }
    
    func updateFlash(flashView: UIView) {
        self.captureSession.updateFlash()
        flashView.alpha = self.alphaForFlashButton()
    }
    
    // MARK: - Switch Camera
    
    func switchCamera() {
        self.captureSession.switchCamera()
    }
    
    func alphaForFlashButton() -> CGFloat {
        let alphaOff: CGFloat = 0.5
        guard let device = self.captureSession.device else {
            return alphaOff
        }
        
        switch device.flashMode {
        case .off:
            return alphaOff
        default:
            return 1.0
        }
    }
    
    // MARK: - Capture Image
    
    func takePicture() {
        
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: self.captureSession.mediaType)
        
        switch authorizationStatus {
        case .authorized:
            
            self.captureSession.captureImage { (image) in
                COAppEnvironment.shared().routing?.route(to: COImageCustomizationRoutingEntry(image: image))
            }
            
            break
            
        default: break
            
        }
    }

}
