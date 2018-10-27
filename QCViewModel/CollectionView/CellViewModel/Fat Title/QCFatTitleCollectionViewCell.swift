//
//  QCFatTitleCollectionViewCell.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 27/01/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit
import QCDeviceHelper

public class QCFatTitleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak public var titleLabel: UILabel!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
//        let sizeFont = CGFloat(QCDeviceHelper.isIpad() ? 35 : 19)
//        self.titleLabel.font = UIFont.avenirNextDemiBold(withSize: sizeFont*QCDeviceHelper.deviceWidthScale())
    }
    
}
