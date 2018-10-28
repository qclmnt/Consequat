//
//  COSegmentedPageViewControllerViewModel.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation
import QCViewModel

class COSegmentedPageViewControllerViewModel: NSObject, QCViewControllerViewModel {
    
    // MARK: - Properties
    
    let itemsController: [UIViewController]
    let initController: UIViewController
    
    var currentIndex = 0
    
    weak var segmentedPageDelegate: COSegmentedPageContainerDelegate?

    // MARK: - Initializer
    
    init(itemsController: [UIViewController],
         initController: UIViewController) {
        self.itemsController = itemsController
        self.initController = initController
    }
    
    // MARK: - Page control
    
    func showPage(index: Int, pageController: UIPageViewController?) {
        guard index >= 0,
            index < self.itemsController.count,
            let pageController = pageController else {return}
        
        let viewControllerToShow = self.itemsController[index]
        pageController.setViewControllers([viewControllerToShow],
                                          direction: index > self.currentIndex ? .forward : .reverse,
                                          animated: true,
                                          completion: nil)
    }
    
}

extension COSegmentedPageViewControllerViewModel: UIPageViewControllerDataSource {
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = self.itemsController.index(where: {$0 === viewController}) else {return nil}
        let newIndex = currentIndex-1
        return self.processNewPage(index: newIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = self.itemsController.index(where: {$0 === viewController}) else {return nil}
        let newIndex = currentIndex+1
        return self.processNewPage(index: newIndex)
    }
    
    // MARK: - View controller for index
    
    func processNewPage(index: Int) -> UIViewController? {
        guard index >= 0,
            index < self.itemsController.count else {return nil}
        
        self.currentIndex = index
        return self.itemsController[index]
    }
    
}

extension COSegmentedPageViewControllerViewModel: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        guard let viewContollerToShow = pendingViewControllers.first,
            let indexToShow = self.itemsController.index(where: {$0 === viewContollerToShow}) else {return}
        self.segmentedPageDelegate?.viewControllerShownChanged(index: indexToShow)
        
    }
    
}
