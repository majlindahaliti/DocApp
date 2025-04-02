//
//  AllPagesCoordinator.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation
import UIKit

class AllPagesCoordinator: PushCoordinator{
    var configuration: ((AllPagesViewController) -> ())?
    var viewController : AllPagesViewController?
    var navigationController: UINavigationController?
    var viewModel : AllPagesViewModelProtocol
    var mainCoordinator: HomeScreenCoordinator?
    
    init(viewModel: AllPagesViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = AllPagesViewController.instantiate(.allPages)
        self.viewController?.viewModel = viewModel
    }
}

extension AllPagesCoordinator: AllPagesViewModelCoordinatorDelegate{
    func showMainScreen(showBack: Bool, page: SectionsList) {
        mainCoordinator = HomeScreenCoordinator(viewModel: HomeScreenViewModel(page: page, showBack: showBack), navigationController: self.viewController?.navigationController)
        mainCoordinator?.start()
    }
}
