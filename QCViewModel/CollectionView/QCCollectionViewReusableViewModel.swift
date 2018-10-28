//
//  QCCollectionViewReusableViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 07/02/2017.
//  Copyright © 2017 Quentin CLEMENT. All rights reserved.
//

import UIKit

open class QCCollectionViewReusableViewModel: QCViewModel {
    
    weak public var delegate: QCViewModelDelegate?
    
    public var hasAlreadyLoadData: Bool = false
    
    public func load() {
        // Nothing here
    }
    
    public func configureView(_ view: UIView) {
        // Nothing here
    }
    
    public func handleSuccess() {
        // Nothing here
    }
    
    public func handleFailure(withStatusCode statusCode: Int, error: Error?) {
        // Nothing here
    }
    
    let supplementaryElementKind: String
    
    public init(supplementaryElementKind: String = UICollectionView.elementKindSectionHeader) {
        self.supplementaryElementKind = supplementaryElementKind
    }
    
    open var reuseIdentifier: String {
        return String(describing: UICollectionReusableView.self)
    }
    
    lazy var viewNib: UINib = UINib(nibName: self.reuseIdentifier, bundle: Bundle(for: type(of: self)))
    
    open func viewSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 50) // Default value
    }
    
    open func configureView(view: UICollectionReusableView) {
        // Override in subclass
    }
    
    func register(on collectionView: UICollectionView) {
        collectionView.register(self.viewNib, forSupplementaryViewOfKind: self.supplementaryElementKind, withReuseIdentifier: self.reuseIdentifier)
    }
}
