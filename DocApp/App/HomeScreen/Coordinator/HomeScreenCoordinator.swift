//
//  HomeScreenCoordinator.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation
import UIKit

protocol HomeScreenCoordinatorDelegate {
}

class HomeScreenCoordinator: PushCoordinator{
    var configuration: ((HomeScreenViewController) -> ())?
    var viewController : HomeScreenViewController?
    var navigationController: UINavigationController?
    var viewModel : HomeScreenViewModelProtocol
    
    init(viewModel: HomeScreenViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
       // self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = HomeScreenViewController.instantiate(.homeScreen)
        self.viewController?.viewModel = viewModel
    }
}

