//
//  QCBasicFatBoldCollectionReusableViewStyle.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 06/03/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit
import QCDeviceHelper

open class QCBasicFatBoldCollectionReusableViewStyle: QCBasicBoldCollectionReusableViewStyle {

    override open var titleFont: UIFont {
        get {
            return UIFont.systemFont(ofSize: 70*QCDeviceHelper.deviceWidthScale())
        }
    }
    
    override open var titleAlignement: NSTextAlignment {
        get {
            return .left
        }
    }
    
    override open var numberOfLines: NSInteger {
        get {
            return 0
        }
    }
    
    override open var height: CGFloat {
        get {
            return 200
        }
    }
}
