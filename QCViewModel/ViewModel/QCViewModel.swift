//
//  QCViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 21/6/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

public protocol QCViewModelDelegate: class, UIScrollViewDelegate {
    func viewModelDidStartLoad()
    func viewModelDidLoad()
    func viewModelDidFail(statusCode: Int)
    var viewModel: QCViewModel? { get set }
}

public protocol QCViewModel {
    
    // MARK: - Properties
    var delegate: QCViewModelDelegate? { get set }
    var hasAlreadyLoadData: Bool { get set }
    
    // MARK: - Load
    func load()
    
    // MARK: - View configuration
    func configureView(_ view: UIView)
    
    // MARK: - Success
    func handleSuccess()
    
    // MARK: - Failure
    func handleFailure(withStatusCode statusCode: Int,
                       error: Error?)
}
