//
//  QCMockCollectionViewController.swift
//  Quentin CLEMENTTests
//
//  Created by Quentin CLEMENT on 07/03/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class QCMockCollectionView: UICollectionView {
    
    // MARK: - numberOfSections
    
    var mockNumberOfSections = 0
    override var numberOfSections: Int {
        get {
            return mockNumberOfSections
        }
    }
    
    var mockNumberOfItems = 0
    override func numberOfItems(inSection section: Int) -> Int {
        return mockNumberOfItems
    }

}
