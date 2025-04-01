//
//  DetailsScreenController.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import UIKit

class DetailsScreenViewController: UIViewController, Storyboarded {
    
    //MARK: - IBOutlets
    @IBOutlet weak var coverImageView: UIImageView!
    
    //MARK: - Properties
    var viewModel: DetailsScreenViewModelProtocol?
    var coordinator: DetailsScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        dispatch{
            self.coverImageView.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 30)
        }
    }
}

//MARK : Coordinated
extension DetailsScreenViewController : Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? DetailsScreenCoordinator
    }
}
