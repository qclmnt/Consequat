//
//  COSegmentedPageViewController.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class COSegmentedPageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    let viewModel: COSegmentedPageViewControllerViewModel?
    
    // MARK: - Initialization
    
    init(viewModel: COSegmentedPageViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: nil)
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewModel = self.viewModel,
        let viewControllerToShow = viewModel.initEntry.viewController else {return}
        
        self.setViewControllers([viewControllerToShow], direction: .forward, animated: true, completion: nil)
        self.dataSource = self.viewModel
        self.delegate = self.viewModel
    }

}
