//
//  QCBasicBoldCollectionReusableViewStyle.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 22/02/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit
import QCDeviceHelper

open class QCBasicBoldCollectionReusableViewStyle: QCCollectionReusableViewStyle {
    
    open override var titleFont: UIFont {
        get {
            return UIFont.systemFont(ofSize: 13*QCDeviceHelper.deviceWidthScale())
        }
    }
    
    open override var titleColor: UIColor {
        get {
            return .black
        }
    }

}
