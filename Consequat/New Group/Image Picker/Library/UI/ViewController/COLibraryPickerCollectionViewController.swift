//
//  COLibraryPickerCollectionViewController.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

import QCViewModel

class COLibraryPickerCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    
    let libraryPickerViewModel: COLibraryPickerCollectionViewControllerViewModel?
    
    // MARK: - Initialization
    
    init(libraryPickerViewModel: COLibraryPickerCollectionViewControllerViewModel) {
        
        self.libraryPickerViewModel = libraryPickerViewModel
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
        self.libraryPickerViewModel?.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.libraryPickerViewModel = nil
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.delegate = nil
        self.collectionView?.dataSource = nil
        self.collectionView?.backgroundColor = UIColor(named: "darkGrayBackground")
        
        self.libraryPickerViewModel?.load()
    }

}

// MARK: - QCViewModelDelegate

extension COLibraryPickerCollectionViewController: QCViewModelDelegate {
    
    var viewModel: QCViewModel? {
        get {
            return self.libraryPickerViewModel
        }
        set(newValue) {}
    }
    
    func viewModelDidStartLoad() {
        self.collectionView?.delegate = self.libraryPickerViewModel
        self.collectionView?.dataSource = self.libraryPickerViewModel
    }
    
    func viewModelDidLoad() {
        guard let collectionView = self.collectionView else { return }
        
        self.libraryPickerViewModel?.registerCellsAndReusableViews(on: collectionView)
        collectionView.reloadData()
    }
    
    func viewModelDidFail(statusCode: Int) {}
}
