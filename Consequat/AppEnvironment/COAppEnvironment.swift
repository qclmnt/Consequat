//
//  COAppEnvironment.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCNavigation

struct COAppEnvironment: COEnvironment {
    
    static let instance = COAppEnvironment()
    
    static func shared() -> COAppEnvironment {
        return instance
    }
    
    // MARK: - COEnvironment
    
    var routing: QCNavigator?
    
    init() {
        self.routing = QCRouting()
    }
    
}
