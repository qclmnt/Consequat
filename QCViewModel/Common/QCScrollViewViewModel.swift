//
//  QCScrollViewViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 20/6/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

@objcMembers
open class QCScrollViewViewModel: NSObject, QCViewControllerViewModel {
    
    // MARK: - Properties
    open var enableEmptyScreen: Bool = true // Default value
//    public lazy var emptyScreenDataSource = QCEmptyScreenDataSource()
    public lazy var sections = [QCSection]()
    public lazy var visibleItems = [QCCellViewModel]()
    open var title: String?
    open var imageName: String?
//    open var rightBarButtonItem: QCBarButtonItem?
//    open var leftBarButtonItem: QCBarButtonItem?
    open var statusBarHidden: Bool = false
    open weak var delegate: QCViewModelDelegate?
    open var hasAlreadyLoadData: Bool = false
    
    // MARK: - Load
    
    open func load() {
//        if self.enableEmptyScreen == true {
//            self.emptyScreenDataSource.emptyReason = QCEmptyReasonLoader()
//        }
        self.delegate?.viewModelDidStartLoad()
    }
    
    open func loadSections() {
        // Override in subclasses
    }
    
    func configurePositionOnSections() {
        for index in 0..<self.sections.count {
            self.sections[index].position = index
        }
    }
    
    // MARK: - Success
    open func handleSuccess() {
        self.loadSections()
        self.configurePositionOnSections()
        
        if self.enableEmptyScreen == true {
//            self.emptyScreenDataSource.emptyReason = nil
            self.updateEmptyScreenDataSourceIfNeeded()
        }
        
        self.delegate?.viewModelDidLoad()
    }
    
    // MARK: - Failure
    
    open func handleFailure(withStatusCode statusCode: Int, error: Error?) {
        // Avoid to show the error message if the feed already contains recipes
        if self.sections.count == 0 {
            if self.enableEmptyScreen == true {
                self.configureEmptyScreenError(withStatusCode: statusCode, error: error, contentOffset: 0)
            }
            
            self.delegate?.viewModelDidFail(statusCode: statusCode)
        }
    }
    
    // MARK: - Empty Screens
    open func updateEmptyScreenDataSourceIfNeeded() {
        // Override in subclasses
    }
    
    func configureEmptyScreenError(withStatusCode statusCode: Int, error: Error?, contentOffset: CGFloat) {
//        self.emptyScreenDataSource.emptyReason = QCEmptyReasonNetworkError(statusCode: statusCode, error: error, contentOffset: contentOffset)
    }
    
    // MARK: - View Life Cycle
    open func viewWillAppear(_ animated: Bool) {
        // Nothing here
    }
    
    open func viewDidAppear(_ animated: Bool) {
        // Nothing here
    }
    
    open func viewWillDisappear(_ animated: Bool) {
        // Nothing here
    }
    
    open func viewControllerWillBePopped(_ controller: UIViewController?) {
        // Nothing here
    }
    
    open func pushViewController(fromVM: QCViewControllerViewModel) {
        // Nothing here
    }
    
    open func configureViewController(_ viewController: UIViewController) {
        // Nothing here
    }
    
    open func configureView(_ view: UIView) {
        // Nothing here
    }
}
