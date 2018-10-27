//
//  QCNavigator.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 28/2/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

public protocol QCNavigator {
    var lastRoutingEntry: QCRoutingEntry? { get set }
    func visibleViewController() -> UIViewController?
    func visibleViewController(_ rootViewController: UIViewController?) -> UIViewController?
    func route(to entry: QCRoutingEntry)
    func route(to entry: QCRoutingEntry, from fromViewController: UIViewController?)
}
