//
//  QCCaptureSession.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 24/1/17.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit
import AVFoundation

class QCCaptureSession: NSObject {

    // MARK: - Properties
    
    let session: AVCaptureSession
    let previewLayer: AVCaptureVideoPreviewLayer
    var device: AVCaptureDevice?
    lazy var output = AVCaptureStillImageOutput()
    let mediaType = AVMediaType.video
    
    // MARK: - Initialization
    
    override init() {
        self.session = AVCaptureSession()
                
        if self.session.canSetSessionPreset(AVCaptureSession.Preset.photo) {
            self.session.sessionPreset = AVCaptureSession.Preset.photo
        }
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
        
        if AVCaptureDevice.devices(for: self.mediaType).count > 0 {
            self.device = AVCaptureDevice.default(for: self.mediaType)
        }
        
        super.init()
        
        
        if AVCaptureDevice.devices(for: self.mediaType).count > 0 {
            self.addInput()
        }
        
        self.addOutput()
    }
    
    // MARK: - Input
    
    func addInput() {
        if let device = self.device {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                self.session.addInput(input)
            } catch  {
                
            }
        }
    }
    
    // MARK: - Output
    
    func addOutput() {
        self.output.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
        self.session.addOutput(self.output)
    }
    
    // MARK: - Video Preview Layer
    
    @objc func configurePreviewOrientation() {
        
        // Fix an apple bug where preview is oriented incorrectly, we must oriented the preview correctly
        if let connection = self.previewLayer.connection,
            connection.isVideoOrientationSupported {
            
            let currentDevice = UIDevice.current
            let orientation = currentDevice.orientation
            
            switch (orientation) {
            case .portrait:
                self.updatePreviewLayer(connection: connection, orientation: .portrait)
            case .landscapeRight:
                self.updatePreviewLayer(connection: connection, orientation: .landscapeLeft)
            case .landscapeLeft:
                self.updatePreviewLayer(connection: connection, orientation: .landscapeRight)
            case .portraitUpsideDown:
                self.updatePreviewLayer(connection: connection, orientation: .portraitUpsideDown)
            default:
                self.updatePreviewLayer(connection: connection, orientation: .portrait)
            }
        }
    }
    
    func configureVideoPreviewLayer(onView: UIView) {
        self.configurePreviewOrientation()
        let layerRect = onView.layer.bounds
        self.previewLayer.frame = layerRect
        self.previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        onView.layer.addSublayer(self.previewLayer)
    }
    
    private func updatePreviewLayer(connection: AVCaptureConnection, orientation: AVCaptureVideoOrientation) {
        connection.videoOrientation = orientation
    }
    
    // MARK: - Session
    
    func startSession(capturePhotoView: UIView) {
        self.configureVideoPreviewLayer(onView: capturePhotoView)
        self.session.startRunning()
    }
    
    func stopSession() {
        self.session.stopRunning()
    }
    
    // MARK: - Flash
    
    func startFlash() {
        self.configureFlash(flashMode: .on)
    }
    
    func stopFlash() {
       self.configureFlash(flashMode: .off)
    }
    
    func configureFlash(flashMode: AVCaptureDevice.FlashMode) {
        guard let device = self.device else { return }
        if device.hasFlash && device.isFlashModeSupported(flashMode) {
            
            do {
                try device.lockForConfiguration()
            } catch  {
                
            }
            device.flashMode = flashMode
            device.unlockForConfiguration()
        }
    }
    
    func updateFlash() {
        guard let device = self.device else { return }        
        switch device.flashMode {
        case .on:
            self.stopFlash()
        case .off:
            self.startFlash()
        default:
            return
        }
    }
    
    // MARK: - Capture Image
    
    func captureImage(completion: @escaping (UIImage) -> Void) {
        var captureConnection: AVCaptureConnection?
        
        // Get capture connection
        for connection in self.output.connections {
                for port in connection.inputPorts {
                        if port.mediaType == AVMediaType.video {
                            captureConnection = connection
                            break
                        }
                }
                
                if (captureConnection != nil) {
                    break
                }
        }
        
        if let connection = captureConnection {
            self.output.captureStillImageAsynchronously(from: connection) { (imageSampleBuffer, error) in
                if let buffer = imageSampleBuffer,
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(buffer),
                    var image = UIImage(data: imageData) {
                    
                    // Fix an apple bug where preview is oriented incorrectly, we should orient the image correctly
                    let currentDevice = UIDevice.current
                    let orientation = currentDevice.orientation
                    
//                    switch (orientation) {
//                    case .landscapeLeft:
//                        image = image.rotate(inDegrees: 90)
//                    case .landscapeRight:
//                        image = image.rotate(inDegrees: -90)
//                    case .portraitUpsideDown:
//                        image = image.rotate(inDegrees: 180)
//                    default:
//                        break
//                    }
                    
                    completion(image)
                    
                }
                
            }
        }
        
    }
    
    // MARK: - Camera
    func switchCamera() {
        guard let currentInput = session.inputs.first as? AVCaptureDeviceInput,
            let newCameraDevice = currentInput.device.position == .back ? getCamera(with: .front) : getCamera(with: .back),
            let newVideoInput = try? AVCaptureDeviceInput(device: newCameraDevice) else {
                return
        }
        
        session.beginConfiguration()
        session.removeInput(currentInput)
        session.addInput(newVideoInput)
        session.commitConfiguration()
    }
    
    func getCamera(with position: AVCaptureDevice.Position) -> AVCaptureDevice? {        
        let devices = AVCaptureDevice.devices(for: AVMediaType.video)
        return devices.filter {
            $0.position == position
            }.first
    }
}
