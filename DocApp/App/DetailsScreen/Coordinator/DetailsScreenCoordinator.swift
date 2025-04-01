//
//  DetailsScreenCoordinator.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation
import UIKit

class DetailsScreenCoordinator: PushCoordinator{
    var configuration: ((DetailsScreenViewController) -> ())?
    var viewController : DetailsScreenViewController?
    var navigationController: UINavigationController?
    var viewModel : DetailsScreenViewModelProtocol
    
    init(viewModel: DetailsScreenViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
       // self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = DetailsScreenViewController.instantiate(.detailsScreen)
        self.viewController?.viewModel = viewModel
    }
}
