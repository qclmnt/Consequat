//
//  COLibraryPickerSection.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

import Photos

class COLibraryPickerSection: QCCollectionViewSection {
    
    // MARK: - QCCollectionViewSection
    
    override var edgeInsets: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        }
    }
    
    override var numberOfColumns: UInt {
        get {
            return 3
        }
    }
    
    override var minimumLineSpacing: CGFloat {
        get {
            return 4
        }
    }
    
    override var minimumInteritemSpacing: CGFloat {
        get {
            return 4
        }
    }
    
    override func setup() {
        self.items = [QCCellViewModel]()
        
        self.fetchResult.enumerateObjects({ [unowned self] (asset, index, stop) in
            
        })
    }
    
    // MARK: - Fetch photos
    
    lazy var fetchResult: PHFetchResult<PHAsset> = {
        let allPhotosOptions = PHFetchOptions()
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate",
                                                             ascending: false)]
        return PHAsset.fetchAssets(with: allPhotosOptions)
    }()

}
