//
//  HomeScreenViewController.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import UIKit

class HomeScreenViewController: UIViewController, Storyboarded {
    
    //MARK: - Properties
    var viewModel: HomeScreenViewModelProtocol?
    var coordinator: HomeScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//MARK : Coordinated
extension HomeScreenViewController : Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? HomeScreenCoordinator
    }
}
