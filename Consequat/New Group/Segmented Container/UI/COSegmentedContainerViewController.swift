//
//  COSegmentedContainerViewController.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class COSegmentedContainerViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var segmentedControl: COSegmentedControl?
    
    let pageViewController: COSegmentedPageViewController?
    let viewModel: COSegmentedPageViewControllerViewModel?
    
    // MARK: - Initialization
    
    init(viewModel: COSegmentedPageViewControllerViewModel) {
        self.viewModel = viewModel
        self.pageViewController = COSegmentedPageViewController(viewModel: viewModel)
        super.init(nibName: String(describing: COSegmentedContainerViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = nil
        self.pageViewController = nil
        super.init(nibName: String(describing: COSegmentedContainerViewController.self),
                   bundle: nil)
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let containerView = self.containerView else {return}
        self.pageViewController?.view.frame = containerView.bounds
        
        if let pageViewController = self.pageViewController {
            self.addChild(pageViewController)
            self.containerView?.addSubview(pageViewController.view)
            pageViewController.didMove(toParent: self)
        }
    
    }

    @IBAction func segmentedControllerValueChanged(_ sender: COSegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        self.viewModel?.showPage(index: index,
                                 pageController: self.pageViewController)
//        if index = 0 {
//
//        } else {
//
//        }
    }
}
