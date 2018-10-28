//
//  COWelcomeViewController.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 27/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class COWelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: COWelcomeViewControllerViewModel?
    
    @IBOutlet weak var welcomeImageView: UIImageView?
    @IBOutlet weak var libraryButton: UIButton?
    @IBOutlet weak var cameraButton: UIButton?
    
    // MARK: - Initialization
    
    init(viewModel: COWelcomeViewControllerViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: String(describing: COWelcomeViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = nil
        
        super.init(nibName: String(describing: COWelcomeViewController.self),
                   bundle: nil)
    }
    
    // MARK: - IBActions
    
    @IBAction func libraryButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel?.routeToLibrary()
    }
    
    @IBAction func cameraButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel?.routeToCamera()
    }

}
