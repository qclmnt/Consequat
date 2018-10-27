//
//  QCFatTitleSection.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 01/02/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

public class QCFatTitleSection: QCCollectionViewSection {
    
    public let title: String
    public var verticalEdgeInsets: CGFloat?
    public var horizontalEdgeInsets: CGFloat?
    
    // MARK: - initialization
    
    public init(title: String) {
        self.title = title
        
        super.init()
    }
    
    public convenience init(title: String,
                     verticalEdgeInsets: CGFloat,
                     horizontalEdgeInsets: CGFloat?) {
        self.init(title: title)
        
        self.verticalEdgeInsets = verticalEdgeInsets
        self.horizontalEdgeInsets = horizontalEdgeInsets
    }
    
    // MARK: - QCCollectionViewSection
    
    override public var edgeInsets: UIEdgeInsets {
        
        guard let verticalEdgeInsets = self.verticalEdgeInsets,
            let horizontalEdgeInsets = self.horizontalEdgeInsets else {
            return super.edgeInsets
        }
        
        return UIEdgeInsets(top: verticalEdgeInsets,
                            left: horizontalEdgeInsets,
                            bottom: verticalEdgeInsets,
                            right: horizontalEdgeInsets)
    }
    
    override public func setup() {
        self.items = [QCCellViewModel]()
        self.items.append(QCFatTitleCellViewModel(title: self.title))
    }

}
