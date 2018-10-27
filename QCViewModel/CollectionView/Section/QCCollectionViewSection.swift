//
//  QCCollectionViewSection.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 23/01/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit
import QCDeviceHelper

@objc open class QCCollectionViewSection: QCSection {
    
    // MARK: - Properties
    
    open var edgeInsets: UIEdgeInsets {
        return QCDeviceHelper.isIpad() ? UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8) : UIEdgeInsets.zero
    }
    
    open var numberOfColumns: UInt {
        return QCDeviceHelper.isIpad() ? 3 : 1 // Default value
    }
    
    open var minimumLineSpacing: CGFloat {
        return QCDeviceHelper.isIpad() ? 8 : 0 // Default value
    }
    
    open var minimumInteritemSpacing: CGFloat {
        return QCDeviceHelper.isIpad() ? 8 : 0 // Default value
    }
    
    open var header: QCCollectionViewReusableViewModel?
    open var footer: QCCollectionViewReusableViewModel?
    public lazy var decoration = QCDecorationCollectionReusableViewModel()
    
    // MARK: - Init
    public override init() {
        super.init()
        self.setup()
    }
    
    // MARK: - Setup
    
    open func setup() {
        // Override in subclass to create items, header and footer
    }

}
