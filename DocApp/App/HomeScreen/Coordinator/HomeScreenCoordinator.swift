//
//  HomeScreenCoordinator.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation
import UIKit

class HomeScreenCoordinator: PushCoordinator{
    var configuration: ((HomeScreenViewController) -> ())?
    var viewController : HomeScreenViewController?
    var navigationController: UINavigationController?
    var viewModel : HomeScreenViewModelProtocol
    var detailsScreenCoordinator: DetailsScreenCoordinator?
    var allPagesScreenCoordinator: AllPagesCoordinator?
    
    init(viewModel: HomeScreenViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = HomeScreenViewController.instantiate(.homeScreen)
        self.viewController?.viewModel = viewModel
    }
}

extension HomeScreenCoordinator: HomeScreenViewModelCoordinatorDelegate{
    func showDetailsScreen() {
        detailsScreenCoordinator = DetailsScreenCoordinator(viewModel: DetailsScreenViewModel(), navigationController: self.viewController?.navigationController)
        detailsScreenCoordinator?.start()
    }
    
    func showAllPages() {
        allPagesScreenCoordinator = AllPagesCoordinator(viewModel: AllPagesViewModel(), navigationController: self.viewController?.navigationController)
        allPagesScreenCoordinator?.start()
    }
}
