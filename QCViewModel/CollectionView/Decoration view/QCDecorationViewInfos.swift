//
//  QCDecorationViewInfos.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 27/04/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class QCDecorationViewInfos: NSObject {
    
    let collectionViewWidth: CGFloat
    let numberOfColumns: UInt
    let sectionEdgeInsets: UIEdgeInsets
    private lazy var sectionsItemHeight: [Int: CGFloat] = [Int: CGFloat]() // [Row index: section height]
    private lazy var biggestItemHeight = CGFloat(0)
    
    // MARK: - Initialization
    
    init(collectionViewWidth: CGFloat,
         numberOfColumns: UInt,
         sectionEdgeInsets: UIEdgeInsets) {
        
        self.collectionViewWidth = collectionViewWidth
        self.numberOfColumns = numberOfColumns
        self.sectionEdgeInsets = sectionEdgeInsets
        super.init()
    }
    
    // MARK: - Helpers
    
    func addSectionItemHeight(item: Int, height: CGFloat) {
        self.sectionsItemHeight[item] = height
        self.biggestItemHeight = max(height, self.biggestItemHeight)
    }
    
    func decorationHeight(numberOfItems: Int) -> CGFloat {
        if (self.numberOfColumns > 1) { // Multiple columns
            let numberOfLines = ceil(CGFloat(numberOfItems)/CGFloat(self.numberOfColumns))
            return numberOfLines * self.biggestItemHeight
        } else {                        // One column
            var sectionsItemHeightSum = CGFloat(0)
            for value in self.sectionsItemHeight.values {
                sectionsItemHeightSum = sectionsItemHeightSum + value
            }
            
            return sectionsItemHeightSum
        }
    }
    
    func decorationWidth() -> CGFloat {
        return (self.collectionViewWidth - (self.sectionEdgeInsets.right + self.sectionEdgeInsets.left))
    }
    
    func decorationSize(numberOfItems: Int) -> CGSize {
        let width = self.decorationWidth()
        let height = self.decorationHeight(numberOfItems: numberOfItems)
        return CGSize(width: width, height: height)
    }

}
