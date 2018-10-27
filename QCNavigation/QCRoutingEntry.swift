//
//  QCRoutingEntry.swift
//  Quentin CLEMENT
//
//  Created by Quentin on 15/05/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

public protocol QCRoutingEntry {
    
    // MARK: - Properties
    
    var viewController: UIViewController? {get}
    var navigationStyle: QCNavigationStyle {get}
    var animated: Bool {get}
    var url: String? {get}
    var completionBlock: (() -> Void)? {get}
    
    // MARK: - Custom transition
    
    func performCustomTransition()
    
}

extension QCRoutingEntry {
    
    // MARK: - Default values
    
    public var navigationStyle: QCNavigationStyle {
        return .push
    }
    
    public var animated: Bool {
        return true
    }
    
    public var viewController: UIViewController? {
        return nil
    }
    
    public var url: String? {
        return nil
    }
    
    public var completionBlock: (() -> Void)? {
        return nil
    }
    
    // MARK: - Default implementation
    
    public func performCustomTransition() {}

}
