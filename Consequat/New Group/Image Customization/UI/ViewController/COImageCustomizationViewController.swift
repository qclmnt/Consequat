//
//  COImageCustomizationViewController.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class COImageCustomizationViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var photoImageView: UIImageView?

    let viewModel: COImageCustomizationViewControllerViewModel?
    
    // MARK: - Initialization
    
    init(viewModel: COImageCustomizationViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: COImageCustomizationViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = nil
        super.init(nibName: String(describing: COImageCustomizationViewController.self),
                   bundle: nil)
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = .white
        self.photoImageView?.image = self.viewModel?.image
    }
    
    // MARK: - IBAction
    
    @IBAction func moreButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel?.addEmoji(on: self.photoImageView)
    }

}
