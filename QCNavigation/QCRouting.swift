//
//  QCRouting.swift
//  QCNavigation
//
//  Created by Quentin CLEMENT on 15/05/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

public struct QCRouting: QCNavigator {
    
    public init() {
        
    }
    
    // MARK: - QCNavigator
    
    public var lastRoutingEntry: QCRoutingEntry?
    
    public func visibleViewController() -> UIViewController? {
        return self.visibleViewController(UIApplication.shared.delegate?.window??.rootViewController)
        
    }
    
    public func visibleViewController(_ rootViewController: UIViewController?) -> UIViewController? {
        
        if let rootNavigationController = rootViewController as? UINavigationController {
            let lastViewController: UIViewController? = rootNavigationController.viewControllers.last
            return self.visibleViewController(lastViewController)
        } else if let rootTabBarController = rootViewController as? UITabBarController {
            let selectedViewController: UIViewController? = rootTabBarController.selectedViewController
            return visibleViewController(selectedViewController)
        }
        
        if rootViewController?.presentedViewController == nil {
            return rootViewController
        } else {
            return self.visibleViewController(rootViewController?.presentedViewController)
        }
    }
    
    public func route(to entry: QCRoutingEntry) {
        self.route(to: entry, from: nil)
    }
    
    public func route(to entry: QCRoutingEntry, from fromViewController: UIViewController?) {
        
        var fromVC = fromViewController
        
        if fromVC == nil {
            fromVC = self.visibleViewController()
        }
        
        let viewControllerToDisplay = entry.viewController
        let animated: Bool = entry.animated
        let url = entry.url
        
        // Navigate on main thread to avoid crashes
        DispatchQueue.main.async(execute: {() -> Void in
            switch entry.navigationStyle {
            case .push:
                
                var fromNavigationController: UINavigationController? = fromVC as? UINavigationController
                
                if let navigationController = fromVC?.navigationController {
                    fromNavigationController = navigationController
                }
                if let aDisplay = viewControllerToDisplay {
                    fromNavigationController?.pushViewController(aDisplay, animated: animated)
                }
                
                break
                
            case .pop:
                fromViewController?.navigationController?.popViewController(animated: animated)
                break
                
            case .modal:
                if let aDisplay = viewControllerToDisplay {
                    fromVC?.present(aDisplay, animated: animated,
                                    completion: {() -> Void in
                                        entry.completionBlock?()
                    })
                }
                
                break
                
            case .custom:
                entry.performCustomTransition()
                break
                
            case .openUrl:
                if let anUrlString = url,
                    let finalUrl = URL(string: anUrlString) {
                    if UIApplication.shared.canOpenURL(finalUrl) {
                        UIApplication.shared.open(finalUrl,
                                                  options: [UIApplication.OpenExternalURLOptionsKey : Any](),
                                                  completionHandler: nil)
                    }
                }
                break
                
            case .preview:
                if let aDisplay = viewControllerToDisplay {
                    fromVC?.navigationController?.show(aDisplay, sender: nil)
                }
                break
                
            case .dismiss:
                fromVC?.dismiss(animated: animated, completion: {() -> Void in
                    entry.completionBlock?()
                })
                break
                
            case .selectTab:
//                if let vcToDisplay = viewControllerToDisplay {
//
//                }
                break
                
            }
        })
        
    }
    
    
}
