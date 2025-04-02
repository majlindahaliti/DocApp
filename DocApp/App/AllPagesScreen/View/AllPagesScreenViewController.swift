//
//  AllPagesController.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import UIKit

class AllPagesViewController: UIViewController, Storyboarded {
    
    //MARK: - IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel: AllPagesViewModelProtocol?
    var coordinator: AllPagesCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTable()
    }
    
    func setupUI(){
        dispatch{
            self.headerView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 30)
        }
    }
    
    func setupTable(){
        self.tableView.register(PageTableViewCell.self)
        self.tableView.delegate = self.viewModel?.dataSource
        self.tableView.dataSource = self.viewModel?.dataSource
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        self.coordinator?.stop()
    }
}

//MARK : Coordinated
extension AllPagesViewController : Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? AllPagesCoordinator
    }
}
