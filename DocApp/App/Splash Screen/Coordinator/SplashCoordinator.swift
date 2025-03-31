//
//  SplashCoordinator.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation
import UIKit

class SplashCoordinator: DefaultCoordinator{
    var viewController : SplashViewController?
    var viewModel : SplashViewModelProtocol
    var homeCoordinator: HomeScreenCoordinator?
    
    init(viewModel: SplashViewModelProtocol = SplashViewModel()) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = SplashViewController.instantiate(.splash)
        self.viewController?.viewModel = self.viewModel
    }
}

extension SplashCoordinator: SplashViewModelCoordinatorDelegate{
    func splashScreenShown() {
        homeCoordinator = HomeScreenCoordinator(viewModel: HomeScreenViewModel(), navigationController: viewController?.navigationController)
        homeCoordinator?.start()
    }
}
