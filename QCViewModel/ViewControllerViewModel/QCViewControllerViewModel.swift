//
//  QCViewControllerViewModel.swift
//  Quentin CLEMENT
//
//  Created by Quentin CLEMENT on 21/6/18.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import Foundation

public protocol QCViewControllerViewModel: QCViewModel {
    
    // MARK: - Properties
    var title: String? { get set }
    var imageName: String? { get set }
//    var rightBarButtonItem: QCBarButtonItem? { get set }
//    var leftBarButtonItem: QCBarButtonItem? { get set }
    var statusBarHidden: Bool { get set }
    
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewControllerWillBePopped(_ controller: UIViewController?)
    func pushViewController(fromVM: QCViewControllerViewModel)    
    func configureViewController(_ viewController: UIViewController)
       
}
