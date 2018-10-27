//
//  QCSectionHeaderFooterView.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 21/6/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

public class QCSectionHeaderFooterView: UIView {
    
    // MARK: - Properties
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(title: String?) {
        self.titleLabel.text = title
//        self.titleLabel.font = UIFont.avenirNextRegular(withSize:14)
//        self.titleLabel.textColor = UIColor.appDarkGrayBackgroundColor()
    }
    
}
