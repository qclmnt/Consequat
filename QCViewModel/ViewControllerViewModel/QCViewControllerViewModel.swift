//
//  QCViewControllerViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 21/6/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

public protocol QCViewControllerViewModel: QCViewModel {
    
    // MARK: - Properties
    var title: String? { get set }
    var imageName: String? { get set }
//    var rightBarButtonItem: QCBarButtonItem? { get set }
//    var leftBarButtonItem: QCBarButtonItem? { get set }
    var statusBarHidden: Bool { get set }
    
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewControllerWillBePopped(_ controller: UIViewController?)
    func pushViewController(fromVM: QCViewControllerViewModel)    
    func configureViewController(_ viewController: UIViewController)
       
}

extension QCViewControllerViewModel {
    
    public var title: String? {
        get {
            return nil
        }
        set (newValue) {
            
        }
    }
    
    public var imageName: String? {
        get {
            return nil
        }
        set (newValue) {
            
        }
    }
    
    public var statusBarHidden: Bool {
        get {
            return false
        }
        set (newValue) {
            
        }
    }
    
    public var delegate: QCViewModelDelegate? {
        get {
            return nil
        }
        set (newValue) {
            
        }
    }
    
    public var hasAlreadyLoadData: Bool {
        get {
            return false
        }
        set (newValue) {
            
        }
    }
    
    public func viewWillAppear(_ animated: Bool) {}
    public func viewDidAppear(_ animated: Bool) {}
    public func viewWillDisappear(_ animated: Bool) {}
    
    public func viewControllerWillBePopped(_ controller: UIViewController?) {}
    public func pushViewController(fromVM: QCViewControllerViewModel) {}
    public func configureViewController(_ viewController: UIViewController) {}
    
    public func load() {}
    public func configureView(_ view: UIView) {}
    public func handleSuccess() {}
    public func handleFailure(withStatusCode statusCode: Int, error: Error?) {}
}
