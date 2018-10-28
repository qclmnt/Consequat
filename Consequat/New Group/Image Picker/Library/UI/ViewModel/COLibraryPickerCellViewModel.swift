//
//  COLibraryPickerCellViewModel.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

import Photos

class COLibraryPickerCellViewModel: QCCollectionCellViewModel {
    
    // MARK: - Properties
    
    private let asset: PHAsset
    private let imageManager = PHCachingImageManager()
    private var thumbnailSize = CGSize.zero
    private var imageSize: CGSize {
        return PHImageManagerMaximumSize
    }
    
    // MARK: - Initialization
    
    init(photoAsset: PHAsset) {
        self.asset = photoAsset
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: COLibraryPickerCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        let cellSize = CGSize(width: maxSize.width,
                              height: maxSize.width)
        self.thumbnailSize = cellSize
        return cellSize
    }

    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        
        guard let libraryPickerCell = cell as? COLibraryPickerCollectionViewCell else {return}
        
        self.imageManager.requestImage(for: self.asset,
                                       targetSize: self.thumbnailSize,
                                       contentMode: .aspectFill,
                                       options: nil,
                                       resultHandler: { image, _ in
            
            libraryPickerCell.photoImageView?.image = image
        })
    }
    
}
