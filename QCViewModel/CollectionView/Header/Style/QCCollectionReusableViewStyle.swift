//
//  QCCollectionReusableViewStyle.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 02/02/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit
import QCDeviceHelper

open class QCCollectionReusableViewStyle: NSObject {

    open var titleFont: UIFont {
        get {
            return UIFont.systemFont(ofSize: 11*QCDeviceHelper.deviceWidthScale()) // Default value
        }
    }
    
    open var titleAlignement: NSTextAlignment {
        get {
            return .center // Default value
        }
    }
    
    open var titleColor: UIColor {
        get {
            return .lightGray // Default value
        }
    }
    
    open var backgroundColor: UIColor {
        get {
            return .clear // Default value
        }
    }
    
    open var numberOfLines: NSInteger {
        get {
            return 1 // Default value
        }
    }
    
    open var height: CGFloat {
        get {
            return 50 // Default value
        }
    }
}
