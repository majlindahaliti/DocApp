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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: DetailsScreenViewModelProtocol?
    var coordinator: DetailsScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setValues()
    }
    
    func setupUI(){
        dispatch{
            self.coverImageView.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 30)
        }
    }
    
    func setValues(){
        if let img = self.viewModel?.item?.src{
            self.coverImageView.setImage(with: img)
        }
        self.titleLabel.text = self.viewModel?.item?.title
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        self.coordinator?.stop()
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
