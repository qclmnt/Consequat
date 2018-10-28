//
//  COCameraPickerViewController.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class COCameraPickerViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var cameraView: UIView?
    
    @IBOutlet weak var triggerButton: UIButton?
    @IBOutlet weak var cameraSwipeButton: UIButton?
    @IBOutlet weak var flashButton: UIButton?
    
    @IBOutlet weak var cameraOptionsCollectionView: UICollectionView?
    @IBOutlet weak var optionView: UIView?
    
    let cameraPickerViewModel: COCameraPickerViewModelProtocol?
    
    // MARK: - Initialization
    
    init(cameraPickerViewModel: COCameraPickerViewModelProtocol) {
        self.cameraPickerViewModel = cameraPickerViewModel
        
        super.init(nibName: String(describing: COCameraPickerViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.cameraPickerViewModel = nil
        
        super.init(nibName: String(describing: COCameraPickerViewController.self),
                   bundle: nil)
    }
    
    // MARK: - View life cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let view = self.cameraView {
            self.cameraPickerViewModel?.startSession(capturePhotoView: view)
        }
        if let flashButton = self.flashButton {
            self.cameraPickerViewModel?.updateFlash(flashView: flashButton)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.cameraPickerViewModel?.stopSession()
    }
    
    // MARK: - IBActions
    
    @IBAction func triggerButtonTouchUpInside(_ sender: UIButton) {
        self.cameraPickerViewModel?.takePicture()
    }
    
    @IBAction func cameraSwipeButtonTouchUpInside(_ sender: UIButton) {
        self.cameraPickerViewModel?.switchCamera()
    }
    
    @IBAction func flashButtonTouchUpInside(_ sender: UIButton) {
        self.cameraPickerViewModel?.updateFlash(flashView: sender)
    }
    
}
